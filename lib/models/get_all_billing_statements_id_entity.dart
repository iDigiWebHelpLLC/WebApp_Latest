import 'package:mywebflutterapp/generated/json/base/json_convert_content.dart';
import 'package:mywebflutterapp/generated/json/base/json_field.dart';

class GetAllBillingStatementsIdEntity with JsonConvert<GetAllBillingStatementsIdEntity> {
	@JSONField(name: "billing_statements")
	List<GetAllBillingStatemantsIdBillingStatemants> billingStatements;
	GetAllBillingStatementsIdMeta meta;
}

class GetAllBillingStatemantsIdBillingStatemants with JsonConvert<GetAllBillingStatemantsIdBillingStatemants> {
	int id;
	GetAllBillingStatementsIdBillingStatementsLinks links;
	@JSONField(name: "subscriber_id")
	int subscriberId;
	String state;
	@JSONField(name: "service_period_id")
	int servicePeriodId;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "updated_at")
	String updatedAt;
	@JSONField(name: "closed_at")
	String closedAt;
	@JSONField(name: "start_at")
	String startAt;
	@JSONField(name: "due_at")
	String dueAt;
	@JSONField(name: "posted_at")
	String postedAt;
	@JSONField(name: "statement_attachment_file_name")
	String statementAttachmentFileName;
	String balance;
	@JSONField(name: "net_received")
	String netReceived;
	bool paid;
	@JSONField(name: "past_due")
	bool pastDue;
	@JSONField(name: "statement_attachment_url")
	String statementAttachmentUrl;
	String status;
	String subtotal;
	@JSONField(name: "tax_total")
	String taxTotal;
	String total;
}

class GetAllBillingStatementsIdBillingStatementsLinks with JsonConvert<GetAllBillingStatementsIdBillingStatementsLinks> {
	String buckets;
	String invoices;
	String payments;
}

class GetAllBillingStatementsIdMeta with JsonConvert<GetAllBillingStatementsIdMeta> {
	GetAllBillingStatementsIdMetaPagination pagination;
}

class GetAllBillingStatementsIdMetaPagination with JsonConvert<GetAllBillingStatementsIdMetaPagination> {
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
