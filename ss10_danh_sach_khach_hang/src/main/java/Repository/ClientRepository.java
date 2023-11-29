package Repository;

import Model.Client;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ClientRepository implements IClientRepository {
    static List<Client> clientList = new ArrayList<>();

    static {
        clientList.add(new Client("Nguyễn Văn A", LocalDate.of(1999, 05, 21), "ĐN", "https://cdn.123job.vn/123job/uploads/2020/11/05/2020_11_05______555e152db27140a0e5e842dc76c1db3d.png"));
        clientList.add(new Client("Nguyễn Văn B", LocalDate.of(1999, 05, 21), "ĐN", "https://cdn.123job.vn/123job/uploads/2020/11/05/2020_11_05______555e152db27140a0e5e842dc76c1db3d.png"));
        clientList.add(new Client("Nguyễn Văn C", LocalDate.of(1999, 05, 21), "ĐN", "https://cdn.123job.vn/123job/uploads/2020/11/05/2020_11_05______555e152db27140a0e5e842dc76c1db3d.png"));
        clientList.add(new Client("Nguyễn Văn D", LocalDate.of(1999, 05, 21), "ĐN", "https://cdn.123job.vn/123job/uploads/2020/11/05/2020_11_05______555e152db27140a0e5e842dc76c1db3d.png"));
    }

    @Override
    public List<Client> findAll() {
        return clientList;
    }
}