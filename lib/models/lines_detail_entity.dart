import 'package:mywebflutterapp/generated/json/base/json_convert_content.dart';
import 'package:mywebflutterapp/generated/json/base/json_field.dart';

class LinesDetailEntity with JsonConvert<LinesDetailEntity> {
	List<LinesDetailLine> lines;
	@JSONField(name: "device_identifiers")
	List<LinesDetailDeviceIdentifier> deviceIdentifiers;
	LinesDetailMeta meta;
}

class LinesDetailLine with JsonConvert<LinesDetailLine> {
	int id;
	LinesDetailLinesLinks links;
	LinesDetailLinesMeta meta;
	@JSONField(name: "activated_at")
	String activatedAt;
	@JSONField(name: "activation_delivery_id")
	int activationDeliveryId;
	@JSONField(name: "attribute_values")
	LinesDetailLinesAttributeValues attributeValues;
	@JSONField(name: "caller_id_name")
	dynamic callerIdName;
	@JSONField(name: "carrier_id")
	int carrierId;
	@JSONField(name: "carrier_service_ids")
	List<int> carrierServiceIds;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "data_saver_enabled")
	dynamic dataSaverEnabled;
	@JSONField(name: "deactivation_category_id")
	int deactivationCategoryId;
	dynamic description;
	@JSONField(name: "device_model_id")
	int deviceModelId;
	@JSONField(name: "device_serial")
	String deviceSerial;
	@JSONField(name: "hotline_reason")
	dynamic hotlineReason;
	String iccid;
	String imei;
	String imsi;
	@JSONField(name: "last_carrier_request_id")
	int lastCarrierRequestId;
	@JSONField(name: "last_playbook_state_id")
	int lastPlaybookStateId;
	@JSONField(name: "meid_dec")
	String meidDec;
	@JSONField(name: "meid_hex")
	String meidHex;
	@JSONField(name: "model_number")
	String modelNumber;
	String msid;
	String msl;
	@JSONField(name: "opted_out_carrier_service_ids")
	List<dynamic> optedOutCarrierServiceIds;
	@JSONField(name: "permanent_carrier_service_ids")
	List<int> permanentCarrierServiceIds;
	bool primary;
	dynamic puk1;
	dynamic puk2;
	@JSONField(name: "status_updated_at")
	String statusUpdatedAt;
	String status;
	@JSONField(name: "subscriber_id")
	int subscriberId;
	@JSONField(name: "updated_at")
	String updatedAt;
	String uuid;
	@JSONField(name: "voicemail_language")
	dynamic voicemailLanguage;
	String balance;
	@JSONField(name: "dummy_esn_id")
	dynamic dummyEsnId;
	String manufacturer;
	String mdn;
	String model;
	String nid;
	@JSONField(name: "service_details")
	LinesDetailLinesServiceDetails serviceDetails;
	@JSONField(name: "number_port_id")
	int numberPortId;
	@JSONField(name: "service_address_id")
	int serviceAddressId;
	@JSONField(name: "device_identifier_ids")
	List<int> deviceIdentifierIds;

}

class LinesDetailLinesLinks with JsonConvert<LinesDetailLinesLinks> {
	String buckets;
	@JSONField(name: "carrier_lines")
	String carrierLines;
	@JSONField(name: "carrier_requests")
	String carrierRequests;
	String deliveries;
}

class LinesDetailLinesMeta with JsonConvert<LinesDetailLinesMeta> {
	@JSONField(name: "attribute_titles")
	LinesDetailLinesMetaAttributeTitles attributeTitles;
}

class LinesDetailLinesMetaAttributeTitles with JsonConvert<LinesDetailLinesMetaAttributeTitles> {
	@JSONField(name: "78")
	String x78;
	@JSONField(name: "82")
	String x82;
	@JSONField(name: "77")
	String x77;
	@JSONField(name: "79")
	String x79;
}

class LinesDetailLinesAttributeValues with JsonConvert<LinesDetailLinesAttributeValues> {
	@JSONField(name: "77")
	String x77;
	@JSONField(name: "78")
	String x78;
	@JSONField(name: "79")
	String x79;
	@JSONField(name: "82")
	String x82;
}

class LinesDetailLinesServiceDetails with JsonConvert<LinesDetailLinesServiceDetails> {
	String csa;
	String msl;
	String imsi;
	String msid;
	String preactivated;
}

class LinesDetailDeviceIdentifier with JsonConvert<LinesDetailDeviceIdentifier> {
	int id;
	@JSONField(name: "device_id")
	String deviceId;
	String kind;
	@JSONField(name: "inventory_unit_id")
	int inventoryUnitId;
}

class LinesDetailMeta with JsonConvert<LinesDetailMeta> {
	LinesDetailMetaSums sums;
	LinesDetailMetaPagination pagination;
}

class LinesDetailMetaSums with JsonConvert<LinesDetailMetaSums> {
	String balance;
}

class LinesDetailMetaPagination with JsonConvert<LinesDetailMetaPagination> {
	@JSONField(name: "current_page")
	int currentPage;
	@JSONField(name: "next_page")
	dynamic nextPage;
	@JSONField(name: "prev_page")
	dynamic prevPage;
	@JSONField(name: "total_pages")
	int totalPages;
	@JSONField(name: "total_count")
	int totalCount;
}
