import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class NewDetail extends StatelessWidget {
  
  static show(BuildContext context){
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const NewDetail()));
  }
  
  
  final String htmlData = r"""
  <div class="col-lg-9">
                                                            <article class="single-detail">
                            <h1 class="title">Phụ huynh, thí sinh xác nhận nhập học sớm tại HITU để chắc chân có một bến đỗ an toàn </h1>
                            <div class="post-content">
                                <p style="text-align: justify;"><strong><em>&nbsp; &nbsp; &nbsp;Còn hơn 10 ngày nữa mới đến ngày công bố kết quả xét tuyển học bạ vào Trường Cao đẳng Công thương TPHCM năm 2022, nhưng hiện đã có đông phụ huynh, thí sinh đến nhập học sớm để chắc chân có một bến đỗ an toàn</em></strong></p>
<p><a href="https://hitu.edu.vn/dang-ky-xet-tuyen/"><img class="aligncenter size-full wp-image-1866" src="https://hitu.edu.vn/wp-content/uploads/2022/06/34-Tuyen-sinh-....png" alt="" width="1200" height="620" style="max-width: 100%; height: auto;"></a></p>
<p style="text-align: justify;">&nbsp; &nbsp; &nbsp;Mùa tuyển sinh CĐ – ĐH năm nay có nhiều điểm đặc biệt, khi những thông tin về kỳ thi thay đổi từng ngày, từng giờ cho phù hợp. Hồi hộp là tâm lý chung của nhiều người, nhưng thay vì ngồi im chờ kết quả điểm báo về rồi mới “tính tiếp”, đông phụ huynh đã chủ động “đi trước một bước” để con em mình chắc chân có 1 bến đỗ an toàn. Theo quan sát của admin, ngay sáng ngày 20/6/2022, tại Văn phòng Tuyển sinh nhà trường đã có đông phụ huynh và thí sinh đến nhập học sớm. Không chờ kết quả xét tuyển Đại học, Cao đẳng nhiều phụ huynh và sĩ tử tìm trường nhập học sớm để chắc suất ngành hot, đúng nguyện vọng của mình.</p>
<p><img loading="lazy" class="aligncenter size-full wp-image-1867" src="https://hitu.edu.vn/wp-content/uploads/2022/06/z3506495616089_ad325a0cc64f6c3ea07b80ddeba3a290.jpg" alt="" width="1280" height="960" style="max-width: 100%; height: auto;"></p>
<p style="text-align: justify;">&nbsp; &nbsp; &nbsp;Chị Thơm – Đồng Nai đến làm thủ tục nhập học cho em trai cho biết: “Mình cho em nhập học HITU luôn để đảm bảo có chắc 1 suất học CNTT tại đây, nếu cứ chờ có kết quả thi Đại học thì sợ không còn chỗ vì năm nay xếp hàng đăng ký rất đông. Mình đã tìm hiểu kỹ thông tin trên website <strong><a href="https://hitu.edu.vn/">https://hitu.edu.vn/</a> </strong>và biết chương trình đào tạo ở HITU tối ưu thời gian học, sinh viên có thể đi làm sớm hơn các bạn đồng trang lứa từ nửa năm tới 1 năm nên gia đình rất yên tâm.”</p>
<p><img loading="lazy" class="aligncenter size-full wp-image-1868" src="https://hitu.edu.vn/wp-content/uploads/2022/06/z3506495620562_85c44cfec6203885b9bdae7d2c3d69e6.jpg" alt="" width="960" height="1280" style="max-width: 100%; height: auto;"></p>
<p style="text-align: justify;">&nbsp; &nbsp; &nbsp;Thí sinh cần nộp phí xác nhận nhập học tối thiểu 1.000.000 VND để xác nhận nhập học học tại Cao đẳng Công thương Thành phố Hồ Chí Minh. Số tiền này sẽ được khấu trừ vào học phí của tân sinh viên khi nhập học chính thức.</p>
<p><img loading="lazy" class="aligncenter size-full wp-image-1869" src="https://hitu.edu.vn/wp-content/uploads/2022/06/z3339901222814_0a22922994dcc3eceba0858423d52718.jpg" alt="" width="1280" height="960" style="max-width: 100%; height: auto;"></p>
<p style="text-align: justify;">&nbsp; &nbsp; Ngoài ưu đãi trên, tại Trường Cao đẳng Công thương TPHCM còn có rất nhiều ưu đãi khác như: Thí sinh sẽ có cơ hội nhận được các gói hỗ trợ giá trị từ 50%, 100% học phí khi đăng ký học các ngành Công nghệ Sợi – Dệt; Công nghệ kỹ thuật Hóa học, Công nghệ Da giày, Truyền thông và Mạng máy tính. Miễn 100% học phí học kỳ đầu tiên cho thí sinh trúng tuyển có điểm trung bình các môn trong tổ hợp xét tuyển đạt từ 9.0 trở lên. Giảm 50% học phí cho con thứ 2 nếu gia đình có 2 con cùng đang học tại Trường.</p>
<p style="text-align: justify;">&nbsp; &nbsp; <em>&nbsp;Chúc các bạn sẽ chuẩn bị một hành trang thật tốt khi chính thức trở thành thành viên của đại gia đình Công thương!</em></p>
<p style="text-align: right;"><em>Tin bài, hình ảnh: T.T</em></p>





                            </div>
                        </article>
                        <div class="text-end">
                            <div class="fb-like fb_iframe_widget" data-href="https://hitu.edu.vn/tuyen-sinh/phu-huynh-thi-sinh-xac-nhan-nhap-hoc-som-tai-hitu-de-chac-chan-co-mot-ben-do-an-toan/" data-width="" data-layout="button_count" data-action="like" data-size="small" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=283850155734260&amp;container_width=966&amp;href=https%3A%2F%2Fhitu.edu.vn%2Ftuyen-sinh%2Fphu-huynh-thi-sinh-xac-nhan-nhap-hoc-som-tai-hitu-de-chac-chan-co-mot-ben-do-an-toan%2F&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true&amp;size=small&amp;width="><span style="vertical-align: bottom; width: 150px; height: 28px;"><iframe name="fff5a972a8c6b4" width="1000px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v12.0/plugins/like.php?action=like&amp;app_id=283850155734260&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df345b8e496e6af%26domain%3Dhitu.edu.vn%26is_canvas%3Dfalse%26origin%3Dhttps%253A%252F%252Fhitu.edu.vn%252Ff2e7a6427e5578%26relation%3Dparent.parent&amp;container_width=966&amp;href=https%3A%2F%2Fhitu.edu.vn%2Ftuyen-sinh%2Fphu-huynh-thi-sinh-xac-nhan-nhap-hoc-som-tai-hitu-de-chac-chan-co-mot-ben-do-an-toan%2F&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true&amp;size=small&amp;width=" style="border: none; visibility: visible; width: 150px; height: 28px;" class=""></iframe></span></div>
                        </div>
                        <div class="extranews_separator"></div>
                        <div class="single-tag">
                                                    </div>
                                                </div>
  """;

  const NewDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Html(
            data: htmlData,
          ),
        ),
      ),
    );
  }
}
