package service;

import model.Product;
import Repository.IProductRepository;
import Repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    private static final IProductRepository iProductRepository = new ProductRepository();

    @Override
    public List<Product> display() {
        return iProductRepository.display();
    }

    @Override
    public void add(Product product) {
        iProductRepository.add(product);
    }

    @Override
    public Product findById(int id) {
        return iProductRepository.findById(id);
    }

    @Override
    public void updateProduct(int id, Product product) {
        iProductRepository.updateProduct(id, product);
    }

    @Override
    public void delete(Product product) {
        iProductRepository.delete(product);
    }

    @Override
    public List<Product> findByName(String name) {
        return iProductRepository.findByName(name);
    }
}
