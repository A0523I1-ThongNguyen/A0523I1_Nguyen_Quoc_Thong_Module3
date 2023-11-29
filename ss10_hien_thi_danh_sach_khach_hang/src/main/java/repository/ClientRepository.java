package repository;

import model.Client;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ClientRepository implements  IClientRepository{
    static List<Client> clientList = new ArrayList<>();

    static {
            clientList.add(new Client("Tran Van A", LocalDate.of(1992,04,12),"Da Lat","https://file1.dangcongsan.vn/DATA/0/2018/10/68___gi%E1%BA%BFng_l%C3%A0ng_qu%E1%BA%A3ng_ph%C3%BA_c%E1%BA%A7u__%E1%BB%A9ng_h%C3%B2a___%E1%BA%A3nh_vi%E1%BA%BFt_m%E1%BA%A1nh-16_51_07_908.jpg"));
            clientList.add(new Client("Tran Van B", LocalDate.of(1995,04,12),"Quang Nam","https://gray-wggb-prod.cdn.arcpublishing.com/resizer/_xh57XfkNLvPhn29TFEBrdtoJa0=/1200x675/smart/filters:quality(85)/cloudfront-us-east-1.images.arcpublishing.com/gray/FONECKM6WVAMXKI34PTEN2RGSA.png"));
            clientList.add(new Client("Truong Thi Chi", LocalDate.of(2003,04,12),"Sai Gon","https://swinburne-vn.edu.vn/wp-content/uploads/2022/03/hoc-IT-ra-lam-gi-3.jpg"));
            clientList.add(new Client("Phan Anh", LocalDate.of(1993,04,12),"Da nang","https://career.gpo.vn/uploads/images/225443110/images/gpo-ky-su-phan-mem-nganh-hoc-danh-cho-nhung-ai-dam-me-cong-nghe-1-.jpg"));
            clientList.add(new Client("Phan Thi Quynh", LocalDate.of(2001,04,12),"Hue","https://image.voh.com.vn/voh/thumbnail/2022/06/29/Nguoi-khon-noi-it-nghe-nhi-voh1.jpg"));
    }
    @Override
    public List<Client> show() {
        return clientList;
    }
}
