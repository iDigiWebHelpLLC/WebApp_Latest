import 'package:mywebflutterapp/models/get_products_model_entity.dart';

getProductsModelEntityFromJson(GetProductsModelEntity data, Map<String, dynamic> json) {
	if (json['products'] != null) {
		data.products = new List<GetProductsModelProduct>();
		(json['products'] as List).forEach((v) {
			data.products.add(new GetProductsModelProduct().fromJson(v));
		});
	}
	if (json['meta'] != null) {
		data.meta = new GetProductsModelMeta().fromJson(json['meta']);
	}
	return data;
}

Map<String, dynamic> getProductsModelEntityToJson(GetProductsModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.products != null) {
		data['products'] =  entity.products.map((v) => v.toJson()).toList();
	}
	if (entity.meta != null) {
		data['meta'] = entity.meta.toJson();
	}
	return data;
}

getProductsModelProductFromJson(GetProductsModelProduct data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['links'] != null) {
		data.links = new GetProductsModelProductsLinks().fromJson(json['links']);
	}
	if (json['meta'] != null) {
		data.meta = new GetProductsModelProductsMeta().fromJson(json['meta']);
	}
	if (json['allow_backordering'] != null) {
		data.allowBackordering = json['allow_backordering'];
	}
	if (json['archived_at'] != null) {
		data.archivedAt = json['archived_at'];
	}
	if (json['attribute_values'] != null) {
		data.attributeValues = new GetProductsModelProductsAttributeValues().fromJson(json['attribute_values']);
	}
	if (json['carrier_ids'] != null) {
		data.carrierIds = new List<dynamic>();
		data.carrierIds.addAll(json['carrier_ids']);
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at'].toString();
	}
	if (json['delivery_detail_labels'] != null) {
		data.deliveryDetailLabels = new GetProductsModelProductsDeliveryDetailLabels().fromJson(json['delivery_detail_labels']);
	}
	if (json['inventory_tracking'] != null) {
		data.inventoryTracking = json['inventory_tracking'];
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['orderable'] != null) {
		data.orderable = json['orderable'];
	}
	if (json['product_code'] != null) {
		data.productCode = json['product_code'].toString();
	}
	if (json['product_type_id'] != null) {
		data.productTypeId = json['product_type_id'] is String
				? int.tryParse(json['product_type_id'])
				: json['product_type_id'].toInt();
	}
	if (json['refurbished_product_id'] != null) {
		data.refurbishedProductId = json['refurbished_product_id'];
	}
	if (json['tax_included_code'] != null) {
		data.taxIncludedCode = json['tax_included_code'];
	}
	if (json['tax_transaction_type_id'] != null) {
		data.taxTransactionTypeId = json['tax_transaction_type_id'] is String
				? int.tryParse(json['tax_transaction_type_id'])
				: json['tax_transaction_type_id'].toInt();
	}
	if (json['uicc_sku'] != null) {
		data.uiccSku = json['uicc_sku'];
	}
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at'].toString();
	}
	if (json['fee'] != null) {
		data.fee = json['fee'];
	}
	if (json['plan_id'] != null) {
		data.planId = json['plan_id'] is String
				? int.tryParse(json['plan_id'])
				: json['plan_id'].toInt();
	}
	if (json['external_product_id'] != null) {
		data.externalProductId = json['external_product_id'];
	}
	if (json['price'] != null) {
		data.price = json['price'].toString();
	}
	if (json['primary_image_medium'] != null) {
		data.primaryImageMedium = json['primary_image_medium'];
	}
	if (json['primary_image_thumb'] != null) {
		data.primaryImageThumb = json['primary_image_thumb'];
	}
	if (json['product_category'] != null) {
		data.productCategory = json['product_category'].toString();
	}
	if (json['product_type_name'] != null) {
		data.productTypeName = json['product_type_name'].toString();
	}
	return data;
}

Map<String, dynamic> getProductsModelProductToJson(GetProductsModelProduct entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	if (entity.links != null) {
		data['links'] = entity.links.toJson();
	}
	if (entity.meta != null) {
		data['meta'] = entity.meta.toJson();
	}
	data['allow_backordering'] = entity.allowBackordering;
	data['archived_at'] = entity.archivedAt;
	if (entity.attributeValues != null) {
		data['attribute_values'] = entity.attributeValues.toJson();
	}
	if (entity.carrierIds != null) {
		data['carrier_ids'] =  [];
	}
	data['created_at'] = entity.createdAt;
	if (entity.deliveryDetailLabels != null) {
		data['delivery_detail_labels'] = entity.deliveryDetailLabels.toJson();
	}
	data['inventory_tracking'] = entity.inventoryTracking;
	data['name'] = entity.name;
	data['orderable'] = entity.orderable;
	data['product_code'] = entity.productCode;
	data['product_type_id'] = entity.productTypeId;
	data['refurbished_product_id'] = entity.refurbishedProductId;
	data['tax_included_code'] = entity.taxIncludedCode;
	data['tax_transaction_type_id'] = entity.taxTransactionTypeId;
	data['uicc_sku'] = entity.uiccSku;
	data['updated_at'] = entity.updatedAt;
	data['fee'] = entity.fee;
	data['plan_id'] = entity.planId;
	data['external_product_id'] = entity.externalProductId;
	data['price'] = entity.price;
	data['primary_image_medium'] = entity.primaryImageMedium;
	data['primary_image_thumb'] = entity.primaryImageThumb;
	data['product_category'] = entity.productCategory;
	data['product_type_name'] = entity.productTypeName;
	return data;
}

getProductsModelProductsLinksFromJson(GetProductsModelProductsLinks data, Map<String, dynamic> json) {
	if (json['product_images'] != null) {
		data.productImages = json['product_images'].toString();
	}
	if (json['product_fees'] != null) {
		data.productFees = json['product_fees'].toString();
	}
	if (json['product_payment_plans'] != null) {
		data.productPaymentPlans = json['product_payment_plans'].toString();
	}
	if (json['upsell_products'] != null) {
		data.upsellProducts = json['upsell_products'].toString();
	}
	if (json['warehouses'] != null) {
		data.warehouses = json['warehouses'].toString();
	}
	if (json['warehouse_products'] != null) {
		data.warehouseProducts = json['warehouse_products'].toString();
	}
	return data;
}

Map<String, dynamic> getProductsModelProductsLinksToJson(GetProductsModelProductsLinks entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['product_images'] = entity.productImages;
	data['product_fees'] = entity.productFees;
	data['product_payment_plans'] = entity.productPaymentPlans;
	data['upsell_products'] = entity.upsellProducts;
	data['warehouses'] = entity.warehouses;
	data['warehouse_products'] = entity.warehouseProducts;
	return data;
}

getProductsModelProductsMetaFromJson(GetProductsModelProductsMeta data, Map<String, dynamic> json) {
	if (json['attribute_titles'] != null) {
		data.attributeTitles = new GetProductsModelProductsMetaAttributeTitles().fromJson(json['attribute_titles']);
	}
	return data;
}

Map<String, dynamic> getProductsModelProductsMetaToJson(GetProductsModelProductsMeta entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.attributeTitles != null) {
		data['attribute_titles'] = entity.attributeTitles.toJson();
	}
	return data;
}

getProductsModelProductsMetaAttributeTitlesFromJson(GetProductsModelProductsMetaAttributeTitles data, Map<String, dynamic> json) {
	if (json['11'] != null) {
		data.x11 = json['11'].toString();
	}
	if (json['16'] != null) {
		data.x16 = json['16'].toString();
	}
	if (json['17'] != null) {
		data.x17 = json['17'].toString();
	}
	if (json['19'] != null) {
		data.x19 = json['19'].toString();
	}
	if (json['6'] != null) {
		data.x6 = json['6'].toString();
	}
	return data;
}

Map<String, dynamic> getProductsModelProductsMetaAttributeTitlesToJson(GetProductsModelProductsMetaAttributeTitles entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['11'] = entity.x11;
	data['16'] = entity.x16;
	data['17'] = entity.x17;
	data['19'] = entity.x19;
	data['6'] = entity.x6;
	return data;
}

getProductsModelProductsAttributeValuesFromJson(GetProductsModelProductsAttributeValues data, Map<String, dynamic> json) {
	if (json['6'] != null) {
		data.x6 = new GetProductsModelProductsAttributeValues6().fromJson(json['6']);
	}
	if (json['11'] != null) {
		data.x11 = json['11'] is String
				? int.tryParse(json['11'])
				: json['11'].toInt();
	}
	if (json['16'] != null) {
		data.x16 = json['16'].toString();
	}
	if (json['17'] != null) {
		data.x17 = json['17'] is String
				? int.tryParse(json['17'])
				: json['17'].toInt();
	}
	if (json['19'] != null) {
		data.x19 = json['19'] is String
				? int.tryParse(json['19'])
				: json['19'].toInt();
	}
	return data;
}

Map<String, dynamic> getProductsModelProductsAttributeValuesToJson(GetProductsModelProductsAttributeValues entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.x6 != null) {
		data['6'] = entity.x6.toJson();
	}
	data['11'] = entity.x11;
	data['16'] = entity.x16;
	data['17'] = entity.x17;
	data['19'] = entity.x19;
	return data;
}

getProductsModelProductsAttributeValues6FromJson(GetProductsModelProductsAttributeValues6 data, Map<String, dynamic> json) {
	if (json['All Available LTE Devices'] != null) {
		data.allAvailableLTEDevices = json['All Available LTE Devices'];
	}
	return data;
}

Map<String, dynamic> getProductsModelProductsAttributeValues6ToJson(GetProductsModelProductsAttributeValues6 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['All Available LTE Devices'] = entity.allAvailableLTEDevices;
	return data;
}

getProductsModelProductsDeliveryDetailLabelsFromJson(GetProductsModelProductsDeliveryDetailLabels data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> getProductsModelProductsDeliveryDetailLabelsToJson(GetProductsModelProductsDeliveryDetailLabels entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}

getProductsModelMetaFromJson(GetProductsModelMeta data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> getProductsModelMetaToJson(GetProductsModelMeta entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}