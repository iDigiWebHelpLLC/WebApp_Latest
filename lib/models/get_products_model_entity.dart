import 'package:mywebflutterapp/generated/json/base/json_convert_content.dart';
import 'package:mywebflutterapp/generated/json/base/json_field.dart';

class GetProductsModelEntity with JsonConvert<GetProductsModelEntity> {
	List<GetProductsModelProduct> products;
	GetProductsModelMeta meta;
}

class GetProductsModelProduct with JsonConvert<GetProductsModelProduct> {
	int id;
	GetProductsModelProductsLinks links;
	GetProductsModelProductsMeta meta;
	@JSONField(name: "allow_backordering")
	bool allowBackordering;
	@JSONField(name: "archived_at")
	dynamic archivedAt;
	@JSONField(name: "attribute_values")
	GetProductsModelProductsAttributeValues attributeValues;
	@JSONField(name: "carrier_ids")
	List<dynamic> carrierIds;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "delivery_detail_labels")
	GetProductsModelProductsDeliveryDetailLabels deliveryDetailLabels;
	@JSONField(name: "inventory_tracking")
	dynamic inventoryTracking;
	String name;
	bool orderable;
	@JSONField(name: "product_code")
	String productCode;
	@JSONField(name: "product_type_id")
	int productTypeId;
	@JSONField(name: "refurbished_product_id")
	dynamic refurbishedProductId;
	@JSONField(name: "tax_included_code")
	bool taxIncludedCode;
	@JSONField(name: "tax_transaction_type_id")
	int taxTransactionTypeId;
	@JSONField(name: "uicc_sku")
	dynamic uiccSku;
	@JSONField(name: "updated_at")
	String updatedAt;
	bool fee;
	@JSONField(name: "plan_id")
	int planId;
	@JSONField(name: "external_product_id")
	dynamic externalProductId;
	String price;
	@JSONField(name: "primary_image_medium")
	dynamic primaryImageMedium;
	@JSONField(name: "primary_image_thumb")
	dynamic primaryImageThumb;
	@JSONField(name: "product_category")
	String productCategory;
	@JSONField(name: "product_type_name")
	String productTypeName;
}

class GetProductsModelProductsLinks with JsonConvert<GetProductsModelProductsLinks> {
	@JSONField(name: "product_images")
	String productImages;
	@JSONField(name: "product_fees")
	String productFees;
	@JSONField(name: "product_payment_plans")
	String productPaymentPlans;
	@JSONField(name: "upsell_products")
	String upsellProducts;
	String warehouses;
	@JSONField(name: "warehouse_products")
	String warehouseProducts;
}

class GetProductsModelProductsMeta with JsonConvert<GetProductsModelProductsMeta> {
	@JSONField(name: "attribute_titles")
	GetProductsModelProductsMetaAttributeTitles attributeTitles;
}

class GetProductsModelProductsMetaAttributeTitles with JsonConvert<GetProductsModelProductsMetaAttributeTitles> {
	@JSONField(name: "11")
	String x11;
	@JSONField(name: "16")
	String x16;
	@JSONField(name: "17")
	String x17;
	@JSONField(name: "19")
	String x19;
	@JSONField(name: "6")
	String x6;
}

class GetProductsModelProductsAttributeValues with JsonConvert<GetProductsModelProductsAttributeValues> {
	@JSONField(name: "6")
	GetProductsModelProductsAttributeValues6 x6;
	@JSONField(name: "11")
	int x11;
	@JSONField(name: "16")
	String x16;
	@JSONField(name: "17")
	int x17;
	@JSONField(name: "19")
	int x19;
}

class GetProductsModelProductsAttributeValues6 with JsonConvert<GetProductsModelProductsAttributeValues6> {
	@JSONField(name: "All Available LTE Devices")
	bool allAvailableLTEDevices;
}

class GetProductsModelProductsDeliveryDetailLabels with JsonConvert<GetProductsModelProductsDeliveryDetailLabels> {

}

class GetProductsModelMeta with JsonConvert<GetProductsModelMeta> {

}
