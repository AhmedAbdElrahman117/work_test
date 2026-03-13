import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/app_svg.dart';
import '../models/history_model.dart';

class HistoryCard extends StatelessWidget {
  final HistoryModel history;

  const HistoryCard({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        splashColor: AppColors.gold.withValues(alpha: 0.1),
        highlightColor: AppColors.gold.withValues(alpha: 0.1),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildImage(),
              const SizedBox(width: 16),
              _buildTransactionInfo(context),
              _buildCreditsInfo(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AppSvg(assetName: history.imageUrl, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildTransactionInfo(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(history.restaurantName, style: AppText().subtitle(context)),
          const SizedBox(height: 4),
          Text(
            history.date,
            style: AppText().caption(context, weight: FontWeight.w400),
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: AppText().caption(context, weight: FontWeight.w500),
              children: [
                TextSpan(
                  text: '${history.cost} \u2022 ',
                  style: AppText().caption(
                    context,
                    color: AppColors.gold,
                    weight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: history.credits,
                  style: AppText().caption(
                    context,
                    color: AppColors.primaryText,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreditsInfo(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            history.receivedCredits,
            style: AppText().caption(
              context,
              color: Colors.black,
              weight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.secondaryText,
          size: 14,
        ),
      ],
    );
  }
}
