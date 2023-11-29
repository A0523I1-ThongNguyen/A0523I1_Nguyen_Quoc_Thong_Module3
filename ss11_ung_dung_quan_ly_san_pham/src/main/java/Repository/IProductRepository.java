package Repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> display();

    void add(Product product);

    Product findById(int id);

    int findIndex(int id);

    void updateProduct(int id, Product product);

    void delete(Product product);

    List<Product> findByName(String name);
}
