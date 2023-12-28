import 'package:mashe/core/export_core.dart';

class AppBackButton extends StatelessWidget {
  final void Function() ? onTap;
  const AppBackButton({
    super.key,this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? (){
        Get.back();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.sp),
            color: MyColors.naturalWhite
        ),
        padding: EdgeInsets.all(14.sp),
        child: Image.asset(ImageConstants.backIcon,width: 24.sp,height: 24.sp,),
      ),
    );
  }
}