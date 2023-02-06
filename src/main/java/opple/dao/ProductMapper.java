package opple.dao;

import java.util.List;


import opple.pojo.GroupByCategory;
import opple.pojo.Product;


public interface ProductMapper {

	List<Product> allProduct();

	int insertProduct(Product product);

	int deleteProduct(int id);

	List<Product> selectProductById(int id);

	List<Product> selectProductByProductname(String productname);

	int updateProduct(Product p);

	Product selectaProductById(Product p);

	List<Product> AllProduct();

	List<GroupByCategory> selectProductnumByCategory();

	List<Product> products();

	



}
