package com.joooin.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.joooin.model.MemberMainBean;

/**
 * This view class generates a PDF document 'on the fly' based on the data
 * contained in the model.
 * 
 * @author www.codejava.net
 *
 */
public class PDFBuilder extends AbstractITextPdfView {
	
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
		// get data model which is passed by the Spring container
		@SuppressWarnings("unchecked")
		List<MemberMainBean> list = (List<MemberMainBean>) model.get("allMember");
        doc.add(new Paragraph("會員資料", underlineFont));

		PdfPTable table = new PdfPTable(9);
		table.setWidthPercentage(100.0f);
		table.setWidths(new float[] { 1.0f, 2.0f, 5.0f, 2.0f, 2.0f, 2.0f, 2.0f, 2.0f, 2.0f });
		table.setSpacingBefore(10);

		// define font for table header row
//		Font font = FontFactory.getFont(FontFactory.HELVETICA);

		// define table header cell
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(BaseColor.BLUE);
		cell.setPadding(5);

		// write table header
		cell.setPhrase(new Phrase("會員編號", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("會員姓名", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("會員信箱", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("會員密碼", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("會員性別", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("會員電話", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("會員登入次數", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("會員加入日期", normalFont));
		table.addCell(cell);

		cell.setPhrase(new Phrase("會員認證狀態", normalFont));
		table.addCell(cell);

		// write table row data
		for (MemberMainBean mmb : list) {
			table.addCell(String.valueOf(mmb.getMemberId()));
			table.addCell(String.valueOf(mmb.getMemberName()));
			table.addCell(String.valueOf(mmb.getEmail()));
			table.addCell(String.valueOf(mmb.getPassword()));
			table.addCell(String.valueOf(mmb.getGender()));
			table.addCell(String.valueOf(mmb.getPhone()));
			table.addCell(String.valueOf(mmb.getLogins()));
			table.addCell(String.valueOf(mmb.getMemberCreateDate()));
			table.addCell(String.valueOf(mmb.getCertificationStatus()));
		}

		doc.add(table);

	}

}