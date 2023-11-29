package Repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> list = new ArrayList<>();

    static {
        list.add(new Product(1, "Chocolate", 50000, "Delicious", "sweets"));
        list.add(new Product(2, "Cookie", 5000, "Delicious", "cookies"));
        list.add(new Product(3, "Milk", 10000, "Delicious", "milo"));
    }

    @Override
    public List<Product> display() {
        return list;
    }

    @Override
    public void add(Product product) {
        list.add(product);
    }

    @Override
    public Product findById(int id) {
        for (Product pr : list
        ) {
            if (pr.getId() == id) {
                return pr;
            }
        }
        return null;
    }

    @Override
    public int findIndex(int id) {
        int index = -1;
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId() == id) {
                index = i;
                break;
            }
        }
        return index;
    }

    @Override
    public void updateProduct(int id, Product product) {
        int index = findIndex(id);
        list.set(index, product);
    }

    @Override
    public void delete(Product product) {
        list.remove(product);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> products = new ArrayList<>();
        for (Product pr : list
        ) {
            if (pr.getName().equalsIgnoreCase(name)) {
                products.add(pr);
            }
        }
        return products;
    }
}
