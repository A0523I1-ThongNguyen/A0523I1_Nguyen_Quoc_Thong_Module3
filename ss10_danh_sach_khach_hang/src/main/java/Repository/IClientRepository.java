package Repository;

import Model.Client;

import java.util.List;

public interface IClientRepository{
    List<Client> findAll();
}
