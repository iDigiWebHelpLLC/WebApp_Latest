import 'package:mywebflutterapp/generated/json/base/json_convert_content.dart';
import 'package:mywebflutterapp/generated/json/base/json_field.dart';

class LineRecurringPlansEntity with JsonConvert<LineRecurringPlansEntity> {
	@JSONField(name: "line_recurring_plans")
	List<LineRecurringPlansLineRecurringPlan> lineRecurringPlans;
	LineRecurringPlansMeta meta;
}

class LineRecurringPlansLineRecurringPlan with JsonConvert<LineRecurringPlansLineRecurringPlan> {
	int id;
	@JSONField(name: "product_id")
	int productId;
	@JSONField(name: "current_product_id")
	int currentProductId;
	@JSONField(name: "next_product_id")
	int nextProductId;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "updated_at")
	String updatedAt;
	@JSONField(name: "line_id")
	int lineId;
}

class LineRecurringPlansMeta with JsonConvert<LineRecurringPlansMeta> {

}
