import 'package:mywebflutterapp/generated/json/base/json_convert_content.dart';
import 'package:mywebflutterapp/generated/json/base/json_field.dart';

class GetServiceUsageSummaryDataEntity with JsonConvert<GetServiceUsageSummaryDataEntity> {
	GetServiceUsageSummaryDataTotals totals;
	List<GetServiceUsageSummaryDataLine> lines;
	String startAt;
	String closeAt;
}

class GetServiceUsageSummaryDataTotals with JsonConvert<GetServiceUsageSummaryDataTotals> {
	GetServiceUsageSummaryDataTotalsData data;
	GetServiceUsageSummaryDataTotalsText text;
	GetServiceUsageSummaryDataTotalsVoice voice;
}

class GetServiceUsageSummaryDataTotalsData with JsonConvert<GetServiceUsageSummaryDataTotalsData> {
	String total;
	String remaining;
	String used;
	@JSONField(name: "used_by_lines")
	String usedByLines;
}

class GetServiceUsageSummaryDataTotalsText with JsonConvert<GetServiceUsageSummaryDataTotalsText> {
	String total;
	String remaining;
	String used;
	@JSONField(name: "used_by_lines")
	String usedByLines;
}

class GetServiceUsageSummaryDataTotalsVoice with JsonConvert<GetServiceUsageSummaryDataTotalsVoice> {
	String total;
	String remaining;
	String used;
	@JSONField(name: "used_by_lines")
	String usedByLines;
}

class GetServiceUsageSummaryDataLine with JsonConvert<GetServiceUsageSummaryDataLine> {
	String mdn;
	String uuid;
	GetServiceUsageSummaryDataLinesUsage usage;
	@JSONField(name: "line_id")
	int lineId;
}

class GetServiceUsageSummaryDataLinesUsage with JsonConvert<GetServiceUsageSummaryDataLinesUsage> {
	GetServiceUsageSummaryDataLinesUsageData data;
	GetServiceUsageSummaryDataLinesUsageText text;
	GetServiceUsageSummaryDataLinesUsageVoice voice;
}

class GetServiceUsageSummaryDataLinesUsageData with JsonConvert<GetServiceUsageSummaryDataLinesUsageData> {
	String total;
	String remaining;
	String used;
	@JSONField(name: "used_by_this_line")
	String usedByThisLine;
	bool unlimited;
}

class GetServiceUsageSummaryDataLinesUsageText with JsonConvert<GetServiceUsageSummaryDataLinesUsageText> {
	String total;
	String remaining;
	String used;
	@JSONField(name: "used_by_this_line")
	String usedByThisLine;
	bool unlimited;
}

class GetServiceUsageSummaryDataLinesUsageVoice with JsonConvert<GetServiceUsageSummaryDataLinesUsageVoice> {
	String total;
	String remaining;
	String used;
	@JSONField(name: "used_by_this_line")
	String usedByThisLine;
	bool unlimited;
}
