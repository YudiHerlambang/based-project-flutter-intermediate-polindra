import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/config/app_const.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/config/app_route.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club_item/model/club_item_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubItemWidget extends StatelessWidget {
  final ClubItemModel? clubItemModel;

  const ClubItemWidget({super.key, this.clubItemModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async =>
          Get.toNamed(AppRoute.detailScreen, arguments: clubItemModel?.idTeam),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height / 7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: clubItemModel?.strTeamBadge ?? AppConst.imageExample,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, size: 80),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clubItemModel?.strTeam ?? "-",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    clubItemModel?.strLeague ?? "League",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
            const SizedBox(
              width: 8.0,
            )
          ],
        ),
      ),
    );
  }
}
