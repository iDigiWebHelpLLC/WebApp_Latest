import 'package:mywebflutterapp/models/get_service_usage_summary_data_entity.dart';

getServiceUsageSummaryDataEntityFromJson(GetServiceUsageSummaryDataEntity data, Map<String, dynamic> json) {
	if (json['totals'] != null) {
		data.totals = new GetServiceUsageSummaryDataTotals().fromJson(json['totals']);
	}
	if (json['lines'] != null) {
		data.lines = new List<GetServiceUsageSummaryDataLine>();
		(json['lines'] as List).forEach((v) {
			data.lines.add(new GetServiceUsageSummaryDataLine().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> getServiceUsageSummaryDataEntityToJson(GetServiceUsageSummaryDataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.totals != null) {
		data['totals'] = entity.totals.toJson();
	}
	if (entity.lines != null) {
		data['lines'] =  entity.lines.map((v) => v.toJson()).toList();
	}
	return data;
}

getServiceUsageSummaryDataTotalsFromJson(GetServiceUsageSummaryDataTotals data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new GetServiceUsageSummaryDataTotalsData().fromJson(json['data']);
	}
	if (json['text'] != null) {
		data.text = new GetServiceUsageSummaryDataTotalsText().fromJson(json['text']);
	}
	if (json['voice'] != null) {
		data.voice = new GetServiceUsageSummaryDataTotalsVoice().fromJson(json['voice']);
	}
	return data;
}

Map<String, dynamic> getServiceUsageSummaryDataTotalsToJson(GetServiceUsageSummaryDataTotals entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	if (entity.text != null) {
		data['text'] = entity.text.toJson();
	}
	if (entity.voice != null) {
		data['voice'] = entity.voice.toJson();
	}
	return data;
}

getServiceUsageSummaryDataTotalsDataFromJson(GetServiceUsageSummaryDataTotalsData data, Map<String, dynamic> json) {
	if (json['total'] != null) {
		data.total = json['total'].toString();
	}
	if (json['remaining'] != null) {
		data.remaining = json['remaining'].toString();
	}
	if (json['used'] != null) {
		data.used = json['used'].toString();
	}
	if (json['used_by_lines'] != null) {
		data.usedByLines = json['used_by_lines'].toString();
	}
	return data;
}

Map<String, dynamic> getServiceUsageSummaryDataTotalsDataToJson(GetServiceUsageSummaryDataTotalsData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	data['remaining'] = entity.remaining;
	data['used'] = entity.used;
	data['used_by_lines'] = entity.usedByLines;
	return data;
}

getServiceUsageSummaryDataTotalsTextFromJson(GetServiceUsageSummaryDataTotalsText data, Map<String, dynamic> json) {
	if (json['total'] != null) {
		data.total = json['total'].toString();
	}
	if (json['remaining'] != null) {
		data.remaining = json['remaining'].toString();
	}
	if (json['used'] != null) {
		data.used = json['used'].toString();
	}
	if (json['used_by_lines'] != null) {
		data.usedByLines = json['used_by_lines'].toString();
	}
	return data;
}

Map<String, dynamic> getServiceUsageSummaryDataTotalsTextToJson(GetServiceUsageSummaryDataTotalsText entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	data['remaining'] = entity.remaining;
	data['used'] = entity.used;
	data['used_by_lines'] = entity.usedByLines;
	return data;
}

getServiceUsageSummaryDataTotalsVoiceFromJson(GetServiceUsageSummaryDataTotalsVoice data, Map<String, dynamic> json) {
	if (json['total'] != null) {
		data.total = json['total'].toString();
	}
	if (json['remaining'] != null) {
		data.remaining = json['remaining'].toString();
	}
	if (json['used'] != null) {
		data.used = json['used'].toString();
	}
	if (json['used_by_lines'] != null) {
		data.usedByLines = json['used_by_lines'].toString();
	}
	return data;
}

Map<String, dynamic> getServiceUsageSummaryDataTotalsVoiceToJson(GetServiceUsageSummaryDataTotalsVoice entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	data['remaining'] = entity.remaining;
	data['used'] = entity.used;
	data['used_by_lines'] = entity.usedByLines;
	return data;
}

getServiceUsageSummaryDataLineFromJson(GetServiceUsageSummaryDataLine data, Map<String, dynamic> json) {
	if (json['mdn'] != null) {
		data.mdn = json['mdn'].toString();
	}
	if (json['uuid'] != null) {
		data.uuid = json['uuid'].toString();
	}
	if (json['usage'] != null) {
		data.usage = new GetServiceUsageSummaryDataLinesUsage().fromJson(json['usage']);
	}
	if (json['line_id'] != null) {
		data.lineId = json['line_id'] is String
				? int.tryParse(json['line_id'])
				: json['line_id'].toInt();
	}
	return data;
}

Map<String, dynamic> getServiceUsageSummaryDataLineToJson(GetServiceUsageSummaryDataLine entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['mdn'] = entity.mdn;
	data['uuid'] = entity.uuid;
	if (entity.usage != null) {
		data['usage'] = entity.usage.toJson();
	}
	data['line_id'] = entity.lineId;
	return data;
}

getServiceUsageSummaryDataLinesUsageFromJson(GetServiceUsageSummaryDataLinesUsage data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new GetServiceUsageSummaryDataLinesUsageData().fromJson(json['data']);
	}
	if (json['text'] != null) {
		data.text = new GetServiceUsageSummaryDataLinesUsageText().fromJson(json['text']);
	}
	if (json['voice'] != null) {
		data.voice = new GetServiceUsageSummaryDataLinesUsageVoice().fromJson(json['voice']);
	}
	return data;
}

Map<String, dynamic> getServiceUsageSummaryDataLinesUsageToJson(GetServiceUsageSummaryDataLinesUsage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	if (entity.text != null) {
		data['text'] = entity.text.toJson();
	}
	if (entity.voice != null) {
		data['voice'] = entity.voice.toJson();
	}
	return data;
}

getServiceUsageSummaryDataLinesUsageDataFromJson(GetServiceUsageSummaryDataLinesUsageData data, Map<String, dynamic> json) {
	if (json['total'] != null) {
		data.total = json['total'].toString();
	}
	if (json['remaining'] != null) {
		data.remaining = json['remaining'].toString();
	}
	if (json['used'] != null) {
		data.used = json['used'].toString();
	}
	if (json['used_by_this_line'] != null) {
		data.usedByThisLine = json['used_by_this_line'].toString();
	}
	if (json['unlimited'] != null) {
		data.unlimited = json['unlimited'];
	}
	return data;
}

Map<String, dynamic> getServiceUsageSummaryDataLinesUsageDataToJson(GetServiceUsageSummaryDataLinesUsageData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	data['remaining'] = entity.remaining;
	data['used'] = entity.used;
	data['used_by_this_line'] = entity.usedByThisLine;
	data['unlimited'] = entity.unlimited;
	return data;
}

getServiceUsageSummaryDataLinesUsageTextFromJson(GetServiceUsageSummaryDataLinesUsageText data, Map<String, dynamic> json) {
	if (json['total'] != null) {
		data.total = json['total'].toString();
	}
	if (json['remaining'] != null) {
		data.remaining = json['remaining'].toString();
	}
	if (json['used'] != null) {
		data.used = json['used'].toString();
	}
	if (json['used_by_this_line'] != null) {
		data.usedByThisLine = json['used_by_this_line'].toString();
	}
	if (json['unlimited'] != null) {
		data.unlimited = json['unlimited'];
	}
	return data;
}

Map<String, dynamic> getServiceUsageSummaryDataLinesUsageTextToJson(GetServiceUsageSummaryDataLinesUsageText entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	data['remaining'] = entity.remaining;
	data['used'] = entity.used;
	data['used_by_this_line'] = entity.usedByThisLine;
	data['unlimited'] = entity.unlimited;
	return data;
}

getServiceUsageSummaryDataLinesUsageVoiceFromJson(GetServiceUsageSummaryDataLinesUsageVoice data, Map<String, dynamic> json) {
	if (json['total'] != null) {
		data.total = json['total'].toString();
	}
	if (json['remaining'] != null) {
		data.remaining = json['remaining'].toString();
	}
	if (json['used'] != null) {
		data.used = json['used'].toString();
	}
	if (json['used_by_this_line'] != null) {
		data.usedByThisLine = json['used_by_this_line'].toString();
	}
	if (json['unlimited'] != null) {
		data.unlimited = json['unlimited'];
	}
	return data;
}

Map<String, dynamic> getServiceUsageSummaryDataLinesUsageVoiceToJson(GetServiceUsageSummaryDataLinesUsageVoice entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	data['remaining'] = entity.remaining;
	data['used'] = entity.used;
	data['used_by_this_line'] = entity.usedByThisLine;
	data['unlimited'] = entity.unlimited;
	return data;
}