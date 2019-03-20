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
import com.joooin.model.GroupMainBean;

public class GroupPdf extends AbstractITextPdfView{
	
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
		List<GroupMainBean> list = (List<GroupMainBean>) model.get("allGroup");
		doc.add(new Paragraph("社團資料", titleFont));
		
		PdfPTable table = new PdfPTable(6);
		table.setWidthPercentage(100.0f);
		table.setWidths(new float[] { 2.0f, 3.0f, 5.0f, 5.0f, 4.0f, 4.0f});
		table.setSpacingBefore(10);
		
		PdfPCell cell = new PdfPCell();
		cell.setPadding(5);
		
		cell.setPhrase(new Phrase("No", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Type", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Name", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("LeaderId", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Sign Up", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Members", normalFont));
		table.addCell(cell);
		
		for (GroupMainBean gmb : list) {
			table.addCell(String.valueOf(gmb.getGroupId()));
			cell.setPhrase(new Phrase(String.valueOf(gmb.getGroupType()), normalFont));
			table.addCell(cell);
			cell.setPhrase(new Phrase(String.valueOf(gmb.getGroupName()), normalFont));
			table.addCell(cell);
			table.addCell(String.valueOf(gmb.getGroupLeaderId()));
			table.addCell(String.valueOf(gmb.getGroupCreateDate()));
			table.addCell(String.valueOf(gmb.getGroupCurrentMembers()));
		}
		doc.add(table);
	}

}
