package opple.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import opple.dao.ProductMapper;
import opple.pojo.GroupByCategory;
import opple.pojo.Product;

import opple.service.ProductService;



@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	ProductMapper productMapper;
	@Override
	public List<Product> allProduct(){
		return productMapper.allProduct();
	}
	@Override
	public int insertProduct(Product product) {
		
		return productMapper.insertProduct(product);
	}
	@Override
	public int deleteProduct(int id) {
		
		return productMapper.deleteProduct(id);
	}
	@Override
	public List<Product> selectProductById(int id){
		return productMapper.selectProductById(id);
	}
	@Override
	public List<Product> selectProductByProductname(String productname) {
		
		return productMapper.selectProductByProductname(productname);
	}
	@Override
	public int updateProduct(Product p) {
		
		return productMapper.updateProduct(p);
	}
	@Override
	public Product selectaProductById(Product p) {
		// TODO Auto-generated method stub
		return productMapper.selectaProductById(p);
	}
	@Override
	public List<GroupByCategory> selectProductnumByCategory() {		
		return productMapper.selectProductnumByCategory();
	}
	@Override
	public List<Product> products() {
		// TODO Auto-generated method stub
		return productMapper.products();
	}

	
	
	
	
	

	
	
	
	
	
}

