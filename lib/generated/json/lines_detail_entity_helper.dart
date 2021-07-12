import 'package:mywebflutterapp/models/lines_detail_entity.dart';

linesDetailEntityFromJson(LinesDetailEntity data, Map<String, dynamic> json) {
	if (json['lines'] != null) {
		data.lines = new List<LinesDetailLine>();
		(json['lines'] as List).forEach((v) {
			data.lines.add(new LinesDetailLine().fromJson(v));
		});
	}
	if (json['device_identifiers'] != null) {
		data.deviceIdentifiers = new List<LinesDetailDeviceIdentifier>();
		(json['device_identifiers'] as List).forEach((v) {
			data.deviceIdentifiers.add(new LinesDetailDeviceIdentifier().fromJson(v));
		});
	}
	if (json['meta'] != null) {
		data.meta = new LinesDetailMeta().fromJson(json['meta']);
	}
	return data;
}

Map<String, dynamic> linesDetailEntityToJson(LinesDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.lines != null) {
		data['lines'] =  entity.lines.map((v) => v.toJson()).toList();
	}
	if (entity.deviceIdentifiers != null) {
		data['device_identifiers'] =  entity.deviceIdentifiers.map((v) => v.toJson()).toList();
	}
	if (entity.meta != null) {
		data['meta'] = entity.meta.toJson();
	}
	return data;
}

linesDetailLineFromJson(LinesDetailLine data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['links'] != null) {
		data.links = new LinesDetailLinesLinks().fromJson(json['links']);
	}
	if (json['meta'] != null) {
		data.meta = new LinesDetailLinesMeta().fromJson(json['meta']);
	}
	if (json['activated_at'] != null) {
		data.activatedAt = json['activated_at'].toString();
	}
	if (json['activation_delivery_id'] != null) {
		data.activationDeliveryId = json['activation_delivery_id'] is String
				? int.tryParse(json['activation_delivery_id'])
				: json['activation_delivery_id'].toInt();
	}
	if (json['attribute_values'] != null) {
		data.attributeValues = new LinesDetailLinesAttributeValues().fromJson(json['attribute_values']);
	}
	if (json['caller_id_name'] != null) {
		data.callerIdName = json['caller_id_name'];
	}
	if (json['carrier_id'] != null) {
		data.carrierId = json['carrier_id'] is String
				? int.tryParse(json['carrier_id'])
				: json['carrier_id'].toInt();
	}
	if (json['carrier_service_ids'] != null) {
		data.carrierServiceIds = json['carrier_service_ids']?.map((v) => v is String
				? int.tryParse(v)
				: v.toInt())?.toList()?.cast<int>();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at'].toString();
	}
	if (json['data_saver_enabled'] != null) {
		data.dataSaverEnabled = json['data_saver_enabled'];
	}
	if (json['deactivation_category_id'] != null) {
		data.deactivationCategoryId = json['deactivation_category_id'] is String
				? int.tryParse(json['deactivation_category_id'])
				: json['deactivation_category_id'].toInt();
	}
	if (json['description'] != null) {
		data.description = json['description'];
	}
	if (json['device_model_id'] != null) {
		data.deviceModelId = json['device_model_id'] is String
				? int.tryParse(json['device_model_id'])
				: json['device_model_id'].toInt();
	}
	if (json['device_serial'] != null) {
		data.deviceSerial = json['device_serial'].toString();
	}
	if (json['hotline_reason'] != null) {
		data.hotlineReason = json['hotline_reason'];
	}
	if (json['iccid'] != null) {
		data.iccid = json['iccid'].toString();
	}
	if (json['imei'] != null) {
		data.imei = json['imei'].toString();
	}
	if (json['imsi'] != null) {
		data.imsi = json['imsi'].toString();
	}
	if (json['last_carrier_request_id'] != null) {
		data.lastCarrierRequestId = json['last_carrier_request_id'] is String
				? int.tryParse(json['last_carrier_request_id'])
				: json['last_carrier_request_id'].toInt();
	}
	if (json['last_playbook_state_id'] != null) {
		data.lastPlaybookStateId = json['last_playbook_state_id'] is String
				? int.tryParse(json['last_playbook_state_id'])
				: json['last_playbook_state_id'].toInt();
	}
	if (json['meid_dec'] != null) {
		data.meidDec = json['meid_dec'].toString();
	}
	if (json['meid_hex'] != null) {
		data.meidHex = json['meid_hex'].toString();
	}
	if (json['model_number'] != null) {
		data.modelNumber = json['model_number'].toString();
	}
	if (json['msid'] != null) {
		data.msid = json['msid'].toString();
	}
	if (json['msl'] != null) {
		data.msl = json['msl'].toString();
	}
	if (json['opted_out_carrier_service_ids'] != null) {
		data.optedOutCarrierServiceIds = new List<dynamic>();
		data.optedOutCarrierServiceIds.addAll(json['opted_out_carrier_service_ids']);
	}
	if (json['permanent_carrier_service_ids'] != null) {
		data.permanentCarrierServiceIds = json['permanent_carrier_service_ids']?.map((v) => v is String
				? int.tryParse(v)
				: v.toInt())?.toList()?.cast<int>();
	}
	if (json['primary'] != null) {
		data.primary = json['primary'];
	}
	if (json['puk1'] != null) {
		data.puk1 = json['puk1'];
	}
	if (json['puk2'] != null) {
		data.puk2 = json['puk2'];
	}
	if (json['status_updated_at'] != null) {
		data.statusUpdatedAt = json['status_updated_at'].toString();
	}
	if (json['status'] != null) {
		data.status = json['status'].toString();
	}
	if (json['subscriber_id'] != null) {
		data.subscriberId = json['subscriber_id'] is String
				? int.tryParse(json['subscriber_id'])
				: json['subscriber_id'].toInt();
	}
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at'].toString();
	}
	if (json['uuid'] != null) {
		data.uuid = json['uuid'].toString();
	}
	if (json['voicemail_language'] != null) {
		data.voicemailLanguage = json['voicemail_language'];
	}
	if (json['balance'] != null) {
		data.balance = json['balance'].toString();
	}
	if (json['dummy_esn_id'] != null) {
		data.dummyEsnId = json['dummy_esn_id'];
	}
	if (json['manufacturer'] != null) {
		data.manufacturer = json['manufacturer'].toString();
	}
	if (json['mdn'] != null) {
		data.mdn = json['mdn'].toString();
	}
	if (json['model'] != null) {
		data.model = json['model'].toString();
	}
	if (json['nid'] != null) {
		data.nid = json['nid'].toString();
	}
	if (json['service_details'] != null) {
		data.serviceDetails = new LinesDetailLinesServiceDetails().fromJson(json['service_details']);
	}
	if (json['number_port_id'] != null) {
		data.numberPortId = json['number_port_id'] is String
				? int.tryParse(json['number_port_id'])
				: json['number_port_id'].toInt();
	}
	if (json['service_address_id'] != null) {
		data.serviceAddressId = json['service_address_id'] is String
				? int.tryParse(json['service_address_id'])
				: json['service_address_id'].toInt();
	}
	if (json['device_identifier_ids'] != null) {
		data.deviceIdentifierIds = json['device_identifier_ids']?.map((v) => v is String
				? int.tryParse(v)
				: v.toInt())?.toList()?.cast<int>();
	}
	return data;
}

Map<String, dynamic> linesDetailLineToJson(LinesDetailLine entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	if (entity.links != null) {
		data['links'] = entity.links.toJson();
	}
	if (entity.meta != null) {
		data['meta'] = entity.meta.toJson();
	}
	data['activated_at'] = entity.activatedAt;
	data['activation_delivery_id'] = entity.activationDeliveryId;
	if (entity.attributeValues != null) {
		data['attribute_values'] = entity.attributeValues.toJson();
	}
	data['caller_id_name'] = entity.callerIdName;
	data['carrier_id'] = entity.carrierId;
	data['carrier_service_ids'] = entity.carrierServiceIds;
	data['created_at'] = entity.createdAt;
	data['data_saver_enabled'] = entity.dataSaverEnabled;
	data['deactivation_category_id'] = entity.deactivationCategoryId;
	data['description'] = entity.description;
	data['device_model_id'] = entity.deviceModelId;
	data['device_serial'] = entity.deviceSerial;
	data['hotline_reason'] = entity.hotlineReason;
	data['iccid'] = entity.iccid;
	data['imei'] = entity.imei;
	data['imsi'] = entity.imsi;
	data['last_carrier_request_id'] = entity.lastCarrierRequestId;
	data['last_playbook_state_id'] = entity.lastPlaybookStateId;
	data['meid_dec'] = entity.meidDec;
	data['meid_hex'] = entity.meidHex;
	data['model_number'] = entity.modelNumber;
	data['msid'] = entity.msid;
	data['msl'] = entity.msl;
	if (entity.optedOutCarrierServiceIds != null) {
		data['opted_out_carrier_service_ids'] =  [];
	}
	data['permanent_carrier_service_ids'] = entity.permanentCarrierServiceIds;
	data['primary'] = entity.primary;
	data['puk1'] = entity.puk1;
	data['puk2'] = entity.puk2;
	data['status_updated_at'] = entity.statusUpdatedAt;
	data['status'] = entity.status;
	data['subscriber_id'] = entity.subscriberId;
	data['updated_at'] = entity.updatedAt;
	data['uuid'] = entity.uuid;
	data['voicemail_language'] = entity.voicemailLanguage;
	data['balance'] = entity.balance;
	data['dummy_esn_id'] = entity.dummyEsnId;
	data['manufacturer'] = entity.manufacturer;
	data['mdn'] = entity.mdn;
	data['model'] = entity.model;
	data['nid'] = entity.nid;
	if (entity.serviceDetails != null) {
		data['service_details'] = entity.serviceDetails.toJson();
	}
	data['number_port_id'] = entity.numberPortId;
	data['service_address_id'] = entity.serviceAddressId;
	data['device_identifier_ids'] = entity.deviceIdentifierIds;
	return data;
}

linesDetailLinesLinksFromJson(LinesDetailLinesLinks data, Map<String, dynamic> json) {
	if (json['buckets'] != null) {
		data.buckets = json['buckets'].toString();
	}
	if (json['carrier_lines'] != null) {
		data.carrierLines = json['carrier_lines'].toString();
	}
	if (json['carrier_requests'] != null) {
		data.carrierRequests = json['carrier_requests'].toString();
	}
	if (json['deliveries'] != null) {
		data.deliveries = json['deliveries'].toString();
	}
	return data;
}

Map<String, dynamic> linesDetailLinesLinksToJson(LinesDetailLinesLinks entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['buckets'] = entity.buckets;
	data['carrier_lines'] = entity.carrierLines;
	data['carrier_requests'] = entity.carrierRequests;
	data['deliveries'] = entity.deliveries;
	return data;
}

linesDetailLinesMetaFromJson(LinesDetailLinesMeta data, Map<String, dynamic> json) {
	if (json['attribute_titles'] != null) {
		data.attributeTitles = new LinesDetailLinesMetaAttributeTitles().fromJson(json['attribute_titles']);
	}
	return data;
}

Map<String, dynamic> linesDetailLinesMetaToJson(LinesDetailLinesMeta entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.attributeTitles != null) {
		data['attribute_titles'] = entity.attributeTitles.toJson();
	}
	return data;
}

linesDetailLinesMetaAttributeTitlesFromJson(LinesDetailLinesMetaAttributeTitles data, Map<String, dynamic> json) {
	if (json['78'] != null) {
		data.x78 = json['78'].toString();
	}
	if (json['82'] != null) {
		data.x82 = json['82'].toString();
	}
	if (json['77'] != null) {
		data.x77 = json['77'].toString();
	}
	if (json['79'] != null) {
		data.x79 = json['79'].toString();
	}
	return data;
}

Map<String, dynamic> linesDetailLinesMetaAttributeTitlesToJson(LinesDetailLinesMetaAttributeTitles entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['78'] = entity.x78;
	data['82'] = entity.x82;
	data['77'] = entity.x77;
	data['79'] = entity.x79;
	return data;
}

linesDetailLinesAttributeValuesFromJson(LinesDetailLinesAttributeValues data, Map<String, dynamic> json) {
	if (json['77'] != null) {
		data.x77 = json['77'].toString();
	}
	if (json['78'] != null) {
		data.x78 = json['78'].toString();
	}
	if (json['79'] != null) {
		data.x79 = json['79'].toString();
	}
	if (json['82'] != null) {
		data.x82 = json['82'].toString();
	}
	return data;
}

Map<String, dynamic> linesDetailLinesAttributeValuesToJson(LinesDetailLinesAttributeValues entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['77'] = entity.x77;
	data['78'] = entity.x78;
	data['79'] = entity.x79;
	data['82'] = entity.x82;
	return data;
}

linesDetailLinesServiceDetailsFromJson(LinesDetailLinesServiceDetails data, Map<String, dynamic> json) {
	if (json['csa'] != null) {
		data.csa = json['csa'].toString();
	}
	if (json['msl'] != null) {
		data.msl = json['msl'].toString();
	}
	if (json['imsi'] != null) {
		data.imsi = json['imsi'].toString();
	}
	if (json['msid'] != null) {
		data.msid = json['msid'].toString();
	}
	if (json['preactivated'] != null) {
		data.preactivated = json['preactivated'].toString();
	}
	return data;
}

Map<String, dynamic> linesDetailLinesServiceDetailsToJson(LinesDetailLinesServiceDetails entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['csa'] = entity.csa;
	data['msl'] = entity.msl;
	data['imsi'] = entity.imsi;
	data['msid'] = entity.msid;
	data['preactivated'] = entity.preactivated;
	return data;
}

linesDetailDeviceIdentifierFromJson(LinesDetailDeviceIdentifier data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['device_id'] != null) {
		data.deviceId = json['device_id'].toString();
	}
	if (json['kind'] != null) {
		data.kind = json['kind'].toString();
	}
	if (json['inventory_unit_id'] != null) {
		data.inventoryUnitId = json['inventory_unit_id'] is String
				? int.tryParse(json['inventory_unit_id'])
				: json['inventory_unit_id'].toInt();
	}
	return data;
}

Map<String, dynamic> linesDetailDeviceIdentifierToJson(LinesDetailDeviceIdentifier entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['device_id'] = entity.deviceId;
	data['kind'] = entity.kind;
	data['inventory_unit_id'] = entity.inventoryUnitId;
	return data;
}

linesDetailMetaFromJson(LinesDetailMeta data, Map<String, dynamic> json) {
	if (json['sums'] != null) {
		data.sums = new LinesDetailMetaSums().fromJson(json['sums']);
	}
	if (json['pagination'] != null) {
		data.pagination = new LinesDetailMetaPagination().fromJson(json['pagination']);
	}
	return data;
}

Map<String, dynamic> linesDetailMetaToJson(LinesDetailMeta entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.sums != null) {
		data['sums'] = entity.sums.toJson();
	}
	if (entity.pagination != null) {
		data['pagination'] = entity.pagination.toJson();
	}
	return data;
}

linesDetailMetaSumsFromJson(LinesDetailMetaSums data, Map<String, dynamic> json) {
	if (json['balance'] != null) {
		data.balance = json['balance'].toString();
	}
	return data;
}

Map<String, dynamic> linesDetailMetaSumsToJson(LinesDetailMetaSums entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['balance'] = entity.balance;
	return data;
}

linesDetailMetaPaginationFromJson(LinesDetailMetaPagination data, Map<String, dynamic> json) {
	if (json['current_page'] != null) {
		data.currentPage = json['current_page'] is String
				? int.tryParse(json['current_page'])
				: json['current_page'].toInt();
	}
	if (json['next_page'] != null) {
		data.nextPage = json['next_page'];
	}
	if (json['prev_page'] != null) {
		data.prevPage = json['prev_page'];
	}
	if (json['total_pages'] != null) {
		data.totalPages = json['total_pages'] is String
				? int.tryParse(json['total_pages'])
				: json['total_pages'].toInt();
	}
	if (json['total_count'] != null) {
		data.totalCount = json['total_count'] is String
				? int.tryParse(json['total_count'])
				: json['total_count'].toInt();
	}
	return data;
}

Map<String, dynamic> linesDetailMetaPaginationToJson(LinesDetailMetaPagination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['current_page'] = entity.currentPage;
	data['next_page'] = entity.nextPage;
	data['prev_page'] = entity.prevPage;
	data['total_pages'] = entity.totalPages;
	data['total_count'] = entity.totalCount;
	return data;
}