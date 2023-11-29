package Service;

import Model.Client;
import Repository.ClientRepository;
import Repository.IClientRepository;

import java.util.List;

public class ClientService implements IClientService{
    IClientRepository iClientRepository=new ClientRepository();

    @Override
    public List<Client> display() {
        return iClientRepository.findAll();
    }
}
