import 'package:flutter/material.dart';
import 'package:great_talk/domain/entity/purchase/product/product_entity.dart';
import 'package:great_talk/presentation/notifier/products/products_notifier.dart';
import 'package:great_talk/presentation/notifier/purchases/purchases_notifier.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:great_talk/presentation/page/common/async_page/async_screen/async_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(productsNotifierProvider);
    ProductsNotifier notifier() => ref.read(productsNotifierProvider.notifier);
    final purchasesState = ref.watch(purchasesNotifierProvider);
    final isProActive = purchasesState.value?.isProActive ?? false;
    final isPremiumActive = purchasesState.value?.isPremiumActive ?? false;

    return AsyncScreen(
      asyncValue: asyncValue,
      data: (state) {
        final proProduct = state.proProducts.first;
        final premiumProduct = state.premiumProducts.first;

        void onPressed(ProductEntity product) async {
          ToastUiUtil.showSuccessSnackBar(
            context,
            '情報を取得しています。 \nしばらくお待ちください。',
          );
          final result = await notifier().onPurchaseButtonPressed(product);
          result.when(
            success: (_) {
              ToastUiUtil.showSuccessSnackBar(context, '購入が成功しました');
              ref.invalidate(purchasesNotifierProvider);
            },
            failure: (msg) {
              ToastUiUtil.showFailureSnackBar(context, msg);
            },
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              ProProductCard(
                product: proProduct,
                onPurchaseButtonPressed: onPressed,
                isPurchased: isProActive,
              ),
              const SizedBox(height: 20),
              PremiumProductCard(
                product: premiumProduct,
                onPurchaseButtonPressed: onPressed,
                isPurchased: isPremiumActive,
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}

// Pro Product Card - Clean, Professional Design
class ProProductCard extends StatelessWidget {
  const ProProductCard({
    super.key,
    required this.product,
    required this.onPurchaseButtonPressed,
    required this.isPurchased,
  });

  final ProductEntity product;
  final bool isPurchased;
  final void Function(ProductEntity) onPurchaseButtonPressed;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      child: Container(
        constraints: const BoxConstraints(minHeight: 220),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:
                isDarkMode
                    ? [const Color(0xFF1E3A5F), const Color(0xFF0F2140)]
                    : [const Color(0xFF4A90E2), const Color(0xFF3A7BD5)],
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color:
                  isDarkMode
                      ? Colors.blue.withValues(alpha: 0.3)
                      : Colors.blue.withValues(alpha: 0.4),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background Pattern
            Positioned(
              right: -50,
              top: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.white.withValues(alpha: 0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.star_rounded,
                        size: 40,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        product.price,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '/月',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withValues(alpha: 0.8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white.withValues(alpha: 0.9),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildPurchaseButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPurchaseButton(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: isPurchased ? Colors.white.withValues(alpha: 0.2) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow:
            isPurchased
                ? []
                : [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: isPurchased ? null : () => onPurchaseButtonPressed(product),
          child: Center(
            child: Text(
              isPurchased ? '購入済み' : '今すぐ始める',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color:
                    isPurchased
                        ? Colors.white.withValues(alpha: 0.7)
                        : const Color(0xFF3A7BD5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Premium Product Card - Luxurious, Eye-catching Design
class PremiumProductCard extends StatefulWidget {
  const PremiumProductCard({
    super.key,
    required this.product,
    required this.onPurchaseButtonPressed,
    required this.isPurchased,
  });

  final ProductEntity product;
  final bool isPurchased;
  final void Function(ProductEntity) onPurchaseButtonPressed;

  @override
  State<PremiumProductCard> createState() => _PremiumProductCardState();
}

class _PremiumProductCardState extends State<PremiumProductCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _shimmerAnimation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      child: Container(
        constraints: const BoxConstraints(minHeight: 240),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:
                isDarkMode
                    ? [
                      const Color(0xFF3D1E6D),
                      const Color(0xFF8B1A89),
                      const Color(0xFFDA4167),
                    ]
                    : [
                      const Color(0xFFFF6B6B),
                      const Color(0xFFC44569),
                      const Color(0xFF9B59B6),
                    ],
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFDA4167).withValues(alpha: 0.4),
              blurRadius: 24,
              spreadRadius: 4,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              // Animated Shimmer Effect
              AnimatedBuilder(
                animation: _shimmerAnimation,
                builder: (context, child) {
                  return Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Transform.translate(
                      offset: Offset(_shimmerAnimation.value * 300, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.transparent,
                              Colors.white.withValues(alpha: 0.1),
                              Colors.white.withValues(alpha: 0.2),
                              Colors.white.withValues(alpha: 0.1),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              // Premium Badge
              Positioned(
                top: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber.withValues(alpha: 0.5),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.workspace_premium,
                        size: 16,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'PREMIUM',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -0.5,
                        shadows: [
                          Shadow(
                            blurRadius: 20,
                            color: Colors.black26,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'すべての機能を無制限で',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withValues(alpha: 0.9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          widget.product.price,
                          style: const TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 12,
                                color: Colors.black26,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '/月',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white.withValues(alpha: 0.8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.product.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withValues(alpha: 0.95),
                        height: 1.6,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 28),
                    _buildPremiumButton(context),
                  ],
                ),
              ),
              // Floating Elements
              Positioned(
                bottom: -30,
                right: -30,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Colors.white.withValues(alpha: 0.15),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPremiumButton(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient:
            widget.isPurchased
                ? LinearGradient(
                  colors: [
                    Colors.white.withValues(alpha: 0.2),
                    Colors.white.withValues(alpha: 0.1),
                  ],
                )
                : const LinearGradient(
                  colors: [Colors.amber, Color(0xFFFFC107)],
                ),
        borderRadius: BorderRadius.circular(18),
        boxShadow:
            widget.isPurchased
                ? []
                : [
                  BoxShadow(
                    color: Colors.amber.withValues(alpha: 0.5),
                    blurRadius: 16,
                    spreadRadius: 2,
                    offset: const Offset(0, 6),
                  ),
                ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap:
              widget.isPurchased
                  ? null
                  : () => widget.onPurchaseButtonPressed(widget.product),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!widget.isPurchased) ...[
                  const Icon(
                    Icons.auto_awesome,
                    color: Colors.black87,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  widget.isPurchased ? '購入済み' : 'プレミアムを始める',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color:
                        widget.isPurchased
                            ? Colors.white.withValues(alpha: 0.7)
                            : Colors.black87,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
