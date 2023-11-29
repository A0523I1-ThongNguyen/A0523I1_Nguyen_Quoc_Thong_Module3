package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> display();

    void add(Product product);

    Product findById(int id);

    void updateProduct(int id, Product product);

    void delete(Product product);

    List<Product> findByName(String name);
}
