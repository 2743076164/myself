package opple.controller.rest;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import opple.pojo.GroupByCategory;
import opple.pojo.Product;
import opple.pojo.RequestResult;
import opple.service.ProductService;



@Controller
public class ProductERest {
	@Autowired
	ProductService productService;
	@Autowired
	RequestResult<Product> result;
	@Autowired
	RequestResult<GroupByCategory> result1;
	
	

	@RequestMapping(value = "/rest/products", method = RequestMethod.GET)
	@ResponseBody
	public RequestResult<Product> allProduct() {

		List<Product> productList = productService.allProduct();
		if (productList != null) {
			result.setCode(200);
			result.setMessage("��ѯ���в�Ʒ");
			result.setSuccess(true);
			result.setData(productList);
		} else {
			result.setCode(200);
			result.setMessage("û�в�ѯ����Ʒ");
			result.setSuccess(false);
			result.setData(null);
		} 
		
		return result;
	}
	

	@RequestMapping(value = "/rest/product", method = RequestMethod.POST)
	@ResponseBody
	public RequestResult<Product> insertProduct(@RequestBody Product p) {
		int n = productService.insertProduct(p);
		if (n >= 0) {
			result.setCode(201);
			result.setMessage("�ɹ����һ����Ʒ");
			result.setSuccess(true);
			result.setData(null);
		} else {
			result.setCode(404);
			result.setMessage("��Ʒ���ʧ��");
			result.setSuccess(false);
			result.setData(null);
		}
		return result;
	}

	

	@RequestMapping(value = "/rest/product/id/{id}", method = RequestMethod.GET)
	@ResponseBody
	public RequestResult<Product> selectProductById(@PathVariable int id) {
		List<Product> productList = productService.selectProductById(id);
		if (productList != null) {
			result.setCode(200);
			result.setMessage("�ɹ���ѯ��һ����Ʒ");
			result.setSuccess(true);
			result.setData(productList);
		} else {
			result.setCode(404);
			result.setMessage("û�в�ѯ����Ӧ�Ĳ�Ʒ");
			result.setSuccess(false);
			result.setData(null);
		}
		return result;
	}
	@RequestMapping(value = "/rest/product/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public RequestResult<Product> deleteProduct(@PathVariable int id){
		int n =productService.deleteProduct(id);
		if(n>=1) {
			result.setCode(204);
			result.setMessage("�ɹ���ɾ����һ����Ʒ");
			result.setData(null);
			result.setSuccess(true);
		}else {
			result.setCode(404);
			result.setMessage("��Ʒɾ��ʧ��");
			result.setData(null);
			result.setSuccess(false);
		}
	    return result;
	}

	@RequestMapping(value = "/rest/product/productname/{productname}", method = RequestMethod.GET)
	@ResponseBody
	public RequestResult<Product> selectProductByProductname(@PathVariable String productname) {
		System.out.println("/rest/products/productname/{productname}" + productname);
		List<Product> productList = productService.selectProductByProductname(productname);
		if (productList != null) {
			result.setCode(200);
			result.setMessage("����productname��ѯ��Ʒ");
			result.setSuccess(true);
			result.setData(productList);
		} else {
			result.setCode(200);
			result.setMessage("û�в�ѯ����Ӧ�Ĳ�Ʒ");
			result.setSuccess(false);
			result.setData(null);
		}
		return result;
	}
	@RequestMapping(value ="/rest/product",method=RequestMethod.GET)
	@ResponseBody
	public RequestResult<Product> selectProductByProductname1(String productname){
		
		System.out.println("/rest/productasfaf/productname/{productname}" +productname );
		List<Product> productList = productService.selectProductByProductname(productname);	
		if (productList!=null) {
			result.setCode(200);
			result.setMessage("����productname��ѯ��Ʒ");
			result.setSuccess(true);
			result.setData(productList);	
		} else {
			result.setCode(200);
			result.setMessage("û�в�ѯ����Ӧ�Ĳ�Ʒ");
			result.setSuccess(false);
			result.setData(null);	
		}			
	    return result;
	    }
	

	@RequestMapping(value = "/rest/product", method = RequestMethod.PUT)
	@ResponseBody
	public RequestResult<Product> updateProduct(@RequestBody Product p) {
		int n = productService.updateProduct(p);
		if (n >= 0) {
			result.setCode(200);
			result.setMessage("�ɹ��޸���id=" + p.getId() + "�Ĳ�Ʒ");
			result.setSuccess(true);
			result.setData(null);
		} else {
			result.setCode(200);
			result.setMessage("��Ʒ�޸�ʧ��");
			result.setSuccess(false);
			result.setData(null);
		}
		return result;
	}
	@RequestMapping(value = "/rest/product/numByCategory",method=RequestMethod.GET)
	@ResponseBody
	public RequestResult<GroupByCategory> selectProductnumByCategory(){
		List<GroupByCategory> cateList = productService.selectProductnumByCategory();
		if(cateList!=null) {
			result1.setCode(200);
			result1.setMessage("��Ʒ�������ͼ");
			result1.setSuccess(true);
			result1.setData(cateList);
		}else {
			result1.setCode(404);
			result1.setMessage("û�в�Ʒ�������ͼ");
			result1.setData(null);
			result1.setSuccess(false);
		}
	    return result1;
	}
	@RequestMapping(value = "/products", method = RequestMethod.GET)
	@ResponseBody
	public RequestResult<Product> products(HttpServletResponse response) {

		List<Product> productList = productService.products();
		if (productList != null) {
			result.setCode(200);
			result.setMessage("��ѯ���в�Ʒ");
			result.setSuccess(true);
			result.setData(productList);
		} else {
			result.setCode(200);
			result.setMessage("û�в�ѯ����Ʒ");
			result.setSuccess(false);
			result.setData(null);
		}
		response.setHeader( "Access-Control-Allow-Origin", "*");
		response.setHeader("Cache-Control","no-cache"); 
		return result;
	}
	
	
	
	
	
}
