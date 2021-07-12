import 'package:mywebflutterapp/models/line_recurring_plans_entity.dart';

lineRecurringPlansEntityFromJson(LineRecurringPlansEntity data, Map<String, dynamic> json) {
	if (json['line_recurring_plans'] != null) {
		data.lineRecurringPlans = new List<LineRecurringPlansLineRecurringPlan>();
		(json['line_recurring_plans'] as List).forEach((v) {
			data.lineRecurringPlans.add(new LineRecurringPlansLineRecurringPlan().fromJson(v));
		});
	}
	if (json['meta'] != null) {
		data.meta = new LineRecurringPlansMeta().fromJson(json['meta']);
	}
	return data;
}

Map<String, dynamic> lineRecurringPlansEntityToJson(LineRecurringPlansEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.lineRecurringPlans != null) {
		data['line_recurring_plans'] =  entity.lineRecurringPlans.map((v) => v.toJson()).toList();
	}
	if (entity.meta != null) {
		data['meta'] = entity.meta.toJson();
	}
	return data;
}

lineRecurringPlansLineRecurringPlanFromJson(LineRecurringPlansLineRecurringPlan data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['product_id'] != null) {
		data.productId = json['product_id'] is String
				? int.tryParse(json['product_id'])
				: json['product_id'].toInt();
	}
	if (json['current_product_id'] != null) {
		data.currentProductId = json['current_product_id'] is String
				? int.tryParse(json['current_product_id'])
				: json['current_product_id'].toInt();
	}
	if (json['next_product_id'] != null) {
		data.nextProductId = json['next_product_id'] is String
				? int.tryParse(json['next_product_id'])
				: json['next_product_id'].toInt();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at'].toString();
	}
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at'].toString();
	}
	if (json['line_id'] != null) {
		data.lineId = json['line_id'] is String
				? int.tryParse(json['line_id'])
				: json['line_id'].toInt();
	}
	return data;
}

Map<String, dynamic> lineRecurringPlansLineRecurringPlanToJson(LineRecurringPlansLineRecurringPlan entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['product_id'] = entity.productId;
	data['current_product_id'] = entity.currentProductId;
	data['next_product_id'] = entity.nextProductId;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['line_id'] = entity.lineId;
	return data;
}

lineRecurringPlansMetaFromJson(LineRecurringPlansMeta data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> lineRecurringPlansMetaToJson(LineRecurringPlansMeta entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}