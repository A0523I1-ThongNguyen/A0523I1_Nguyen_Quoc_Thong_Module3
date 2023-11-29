package service;

import model.Client;
import repository.ClientRepository;
import repository.IClientRepository;

import java.util.List;

public class ClientService implements  IClientService{
    IClientRepository iClientRepository = new ClientRepository();
    @Override
    public List<Client> showService() {
        return iClientRepository.show();
    }
}
