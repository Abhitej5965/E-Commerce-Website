package Shop_For_Home_C7_G3First_Microservice.response;

import java.util.List;

import Shop_For_Home_C7_G3First_Microservice.entity.ProductInfo;

public class ProductsResponse {
	
	private List<ProductInfo> productList;

	public List<ProductInfo> getProductList() {
		return productList;
	}

	public void setProductList(List<ProductInfo> productList) {
		this.productList = productList;
	}
	

}
