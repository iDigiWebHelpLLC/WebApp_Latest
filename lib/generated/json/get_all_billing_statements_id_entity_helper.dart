import 'package:mywebflutterapp/models/get_all_billing_statements_id_entity.dart';

getAllBillingStatementsIdEntityFromJson(GetAllBillingStatementsIdEntity data, Map<String, dynamic> json) {
	if (json['billing_statements'] != null) {
		data.billingStatements = new List<GetAllBillingStatemantsIdBillingStatemants>();
		(json['billing_statements'] as List).forEach((v) {
			data.billingStatements.add(new GetAllBillingStatemantsIdBillingStatemants().fromJson(v));
		});
	}
	if (json['meta'] != null) {
		data.meta = new GetAllBillingStatementsIdMeta().fromJson(json['meta']);
	}
	return data;
}

Map<String, dynamic> getAllBillingStatementsIdEntityToJson(GetAllBillingStatementsIdEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.billingStatements != null) {
		data['billing_statements'] =  entity.billingStatements.map((v) => v.toJson()).toList();
	}
	if (entity.meta != null) {
		data['meta'] = entity.meta.toJson();
	}
	return data;
}

getAllBillingStatemantsIdBillingStatemantsFromJson(GetAllBillingStatemantsIdBillingStatemants data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['links'] != null) {
		data.links = new GetAllBillingStatementsIdBillingStatementsLinks().fromJson(json['links']);
	}
	if (json['subscriber_id'] != null) {
		data.subscriberId = json['subscriber_id'] is String
				? int.tryParse(json['subscriber_id'])
				: json['subscriber_id'].toInt();
	}
	if (json['state'] != null) {
		data.state = json['state'].toString();
	}
	if (json['service_period_id'] != null) {
		data.servicePeriodId = json['service_period_id'] is String
				? int.tryParse(json['service_period_id'])
				: json['service_period_id'].toInt();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at'].toString();
	}
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at'].toString();
	}
	if (json['closed_at'] != null) {
		data.closedAt = json['closed_at'].toString();
	}
	if (json['start_at'] != null) {
		data.startAt = json['start_at'].toString();
	}
	if (json['due_at'] != null) {
		data.dueAt = json['due_at'].toString();
	}
	if (json['posted_at'] != null) {
		data.postedAt = json['posted_at'].toString();
	}
	if (json['statement_attachment_file_name'] != null) {
		data.statementAttachmentFileName = json['statement_attachment_file_name'].toString();
	}
	if (json['balance'] != null) {
		data.balance = json['balance'].toString();
	}
	if (json['net_received'] != null) {
		data.netReceived = json['net_received'].toString();
	}
	if (json['paid'] != null) {
		data.paid = json['paid'];
	}
	if (json['past_due'] != null) {
		data.pastDue = json['past_due'];
	}
	if (json['statement_attachment_url'] != null) {
		data.statementAttachmentUrl = json['statement_attachment_url'].toString();
	}
	if (json['status'] != null) {
		data.status = json['status'].toString();
	}
	if (json['subtotal'] != null) {
		data.subtotal = json['subtotal'].toString();
	}
	if (json['tax_total'] != null) {
		data.taxTotal = json['tax_total'].toString();
	}
	if (json['total'] != null) {
		data.total = json['total'].toString();
	}
	return data;
}

Map<String, dynamic> getAllBillingStatemantsIdBillingStatemantsToJson(GetAllBillingStatemantsIdBillingStatemants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	if (entity.links != null) {
		data['links'] = entity.links.toJson();
	}
	data['subscriber_id'] = entity.subscriberId;
	data['state'] = entity.state;
	data['service_period_id'] = entity.servicePeriodId;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['closed_at'] = entity.closedAt;
	data['start_at'] = entity.startAt;
	data['due_at'] = entity.dueAt;
	data['posted_at'] = entity.postedAt;
	data['statement_attachment_file_name'] = entity.statementAttachmentFileName;
	data['balance'] = entity.balance;
	data['net_received'] = entity.netReceived;
	data['paid'] = entity.paid;
	data['past_due'] = entity.pastDue;
	data['statement_attachment_url'] = entity.statementAttachmentUrl;
	data['status'] = entity.status;
	data['subtotal'] = entity.subtotal;
	data['tax_total'] = entity.taxTotal;
	data['total'] = entity.total;
	return data;
}

getAllBillingStatementsIdBillingStatementsLinksFromJson(GetAllBillingStatementsIdBillingStatementsLinks data, Map<String, dynamic> json) {
	if (json['buckets'] != null) {
		data.buckets = json['buckets'].toString();
	}
	if (json['invoices'] != null) {
		data.invoices = json['invoices'].toString();
	}
	if (json['payments'] != null) {
		data.payments = json['payments'].toString();
	}
	return data;
}

Map<String, dynamic> getAllBillingStatementsIdBillingStatementsLinksToJson(GetAllBillingStatementsIdBillingStatementsLinks entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['buckets'] = entity.buckets;
	data['invoices'] = entity.invoices;
	data['payments'] = entity.payments;
	return data;
}

getAllBillingStatementsIdMetaFromJson(GetAllBillingStatementsIdMeta data, Map<String, dynamic> json) {
	if (json['pagination'] != null) {
		data.pagination = new GetAllBillingStatementsIdMetaPagination().fromJson(json['pagination']);
	}
	return data;
}

Map<String, dynamic> getAllBillingStatementsIdMetaToJson(GetAllBillingStatementsIdMeta entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.pagination != null) {
		data['pagination'] = entity.pagination.toJson();
	}
	return data;
}

getAllBillingStatementsIdMetaPaginationFromJson(GetAllBillingStatementsIdMetaPagination data, Map<String, dynamic> json) {
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

Map<String, dynamic> getAllBillingStatementsIdMetaPaginationToJson(GetAllBillingStatementsIdMetaPagination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['current_page'] = entity.currentPage;
	data['next_page'] = entity.nextPage;
	data['prev_page'] = entity.prevPage;
	data['total_pages'] = entity.totalPages;
	data['total_count'] = entity.totalCount;
	return data;
}