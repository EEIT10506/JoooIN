package com.joooin.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.joooin.model.ReportBean;

public class ReportPdf extends AbstractITextPdfView {
	
	final String fontPath = "c:\\windows\\fonts\\kaiu.ttf";
	BaseFont bfChinese;
	Font titleFont;

	Font normalFont;
	Font italicFont;
	Font underlineFont;

	// 設定字型物件
	private void init() throws Exception {
		bfChinese = BaseFont.createFont(fontPath, "Identity-H", BaseFont.NOT_EMBEDDED);
		titleFont = new Font(bfChinese, 18, Font.BOLD);
		normalFont = new Font(bfChinese, 14, Font.NORMAL);
		italicFont = new Font(bfChinese, 12, Font.ITALIC);
		underlineFont = new Font(bfChinese, 40, Font.UNDERLINE);
	}

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		init();
		@SuppressWarnings("unchecked")
		List<ReportBean> list = (List<ReportBean>) model.get("allReport");
		doc.add(new Paragraph("檢舉資料", titleFont));
		
		PdfPTable table = new PdfPTable(7);
		table.setWidthPercentage(100.0f);
		table.setWidths(new float[] { 2.0f, 10.0f, 4.0f, 4.0f, 4.0f, 4.0f, 4.0f});
		table.setSpacingBefore(10);
		
		PdfPCell cell = new PdfPCell();
		cell.setPadding(5);
		
		cell.setPhrase(new Phrase("No", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Date", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("ReportMember", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("ViolatorId", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Type", normalFont));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Content", normalFont));
		table.addCell(cell);
		
		cell.setPhrase(new Phrase("Status", normalFont));
		table.addCell(cell);
		
		for(ReportBean rb : list) {
			cell.setPhrase(new Phrase(String.valueOf(rb.getReportId()), normalFont));
			table.addCell(cell);
			cell.setPhrase(new Phrase(String.valueOf(rb.getReportDate()), normalFont));
			table.addCell(cell);
			cell.setPhrase(new Phrase(String.valueOf(rb.getReportMemberId()), normalFont));
			table.addCell(cell);
			cell.setPhrase(new Phrase(String.valueOf(rb.getReportViolatorId()), normalFont));
			table.addCell(cell);
			cell.setPhrase(new Phrase(String.valueOf(rb.getReportType()), normalFont));
			table.addCell(cell);
			cell.setPhrase(new Phrase(String.valueOf(rb.getReportContent()), normalFont));
			table.addCell(cell);
			cell.setPhrase(new Phrase(String.valueOf(rb.getIsDone()), normalFont));
			table.addCell(cell);
		}
		doc.add(table);
	}
	
	

}
