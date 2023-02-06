package opple.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import opple.pojo.Product;
import opple.pojo.User;
import opple.service.ProductService;
import opple.service.UserService;

@Controller
@SessionAttributes("user")
public class ProductController {
	@Autowired
    UserService userService;
	@Autowired
	ProductService productService;
	@Autowired
    User user;
	
	@RequestMapping("/productList")
	public String allProduct(Model model) {
		List<Product> productList=productService.allProduct();
		model.addAttribute("productList",productList);
		return "productList";
	}
	

	@RequestMapping("/index")
	public String index(User user,HttpSession session,Model model){
		User result = userService.userLogin(user); 
		System.out.println("进入后台index");
		user = (User) session.getAttribute("user");
		session.setAttribute("user", result);//
		System.out.println("来自session的user:     "+user.toString());
		System.out.println("来自result的user:     "+result);
		List<Product> productList = productService.allProduct();
	    model.addAttribute("productList", productList);
	    model.addAttribute("user",result);
	    return "index";
	}
	
	@RequestMapping("/productDetail")
	public String productDetail(Product p, Model model){
		Product product = productService.selectaProductById(p);
	    model.addAttribute("product", product);
	    return "productDetail";
	}

	@RequestMapping(value = "/insertProduct", method = RequestMethod.POST)
	public String insertProduct( Product product, MultipartFile file, Model model) throws IllegalStateException, IOException{		
		System.out.println("insertProduct: " + product.toString());
		 if (!file.isEmpty()) {			
				String path = "D:/tmp";//本地	
//			    String path = "/myImage";	//阿里云	
				System.out.println(path);
	            
				String filename = file.getOriginalFilename();
				File filepath = new File(path, filename);			
				if (!filepath.getParentFile().exists()) {
					filepath.getParentFile().mkdirs();
				}			
				file.transferTo(new File(path + File.separator + filename));
				product.setImage(filename);			
		 	}	
		
		int result = productService.insertProduct(product);
		if (result == 1) {
			model.addAttribute("url", "productList");
			model.addAttribute("infomation", "产品增加成功！");
			model.addAttribute("second", 2);
		} else {
			model.addAttribute("url", "productList");
			model.addAttribute("infomation", "产品增加失败！");
			model.addAttribute("second", 2);
		}
		return "tip";
	}
	
	
	
	

}
