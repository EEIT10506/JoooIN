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
import com.joooin.model.EventMainBean;

public class EventPdf extends AbstractITextPdfView{
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
		List<EventMainBean> list = (List<EventMainBean>) model.get("allEvent");
		doc.add(new Paragraph("活動資料", titleFont));
		
		PdfPTable table = new PdfPTable(5);
		table.setWidthPercentage(100.0f);
		table.setWidths(new float[] { 2.0f, 3.0f, 5.0f, 5.0f, 4.0f});
		table.setSpacingBefore(10);
		
		PdfPCell cell = new PdfPCell();
		cell.setPadding(5);
		
		cell.setPhrase(new Phrase("No", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Name", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Location", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Type", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Members", normalFont));
		table.addCell(cell);
		
		for (EventMainBean emb : list) {
			
			table.addCell(String.valueOf(emb.getEventId()));
			cell.setPhrase(new Phrase(String.valueOf(emb.getEventName()), normalFont));
			table.addCell(cell);
			cell.setPhrase(new Phrase(String.valueOf(emb.getEventLocation()), normalFont));
			table.addCell(cell);
			if(emb.getEventTypeId().equals(1)) {
				cell.setPhrase(new Phrase(String.valueOf("美食"), normalFont));
			}
			if(emb.getEventTypeId().equals(2)) {
				cell.setPhrase(new Phrase(String.valueOf("運動"), normalFont));
			}
			if(emb.getEventTypeId().equals(3)) {
				cell.setPhrase(new Phrase(String.valueOf("娛樂"), normalFont));
			}
			if(emb.getEventTypeId().equals(4)) {
				cell.setPhrase(new Phrase(String.valueOf("其他"), normalFont));
			}
			table.addCell(cell);
			cell.setPhrase(new Phrase(String.valueOf(emb.getEventCurrentMembers()), normalFont));
			table.addCell(cell);
		}
		doc.add(table);

	}
}
