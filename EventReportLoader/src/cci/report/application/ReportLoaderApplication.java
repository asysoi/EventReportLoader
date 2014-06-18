package cci.report.application;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Iterator;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.context.support.AbstractXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import cci.report.service.ReportService;


public class ReportLoaderApplication {

	static final Logger LOG = Logger.getLogger(ReportLoaderApplication.class);

	public static void main(String[] args) {
        LOG.info("Certificate Loader started");  
		
		AbstractXmlApplicationContext context = new FileSystemXmlApplicationContext(
				"conf/jdbcconfig.xml");
		
		ReportService service = context.getBean("ReportService",
			ReportService.class);
		
		service.loadReport();
	
	}

	public void readFromXLSFile() {

		try {
			FileInputStream file = new FileInputStream(new File(
					"Report.xls"));

			HSSFWorkbook workbook = new HSSFWorkbook(file);
			HSSFSheet sheet = workbook.getSheetAt(0);
			Iterator<Row> rowIterator = sheet.iterator();
			int rownumber = 0;

			while (rowIterator.hasNext() && (++rownumber) < 55) {
				Row row = rowIterator.next();
				Iterator<Cell> cellIterator = row.cellIterator();

				while (cellIterator.hasNext()) {
					Cell cell = cellIterator.next();
					System.out.println(cell.getRowIndex()
							+ " : "
							+ cell.getColumnIndex()
							+ " Value : "
							+ (cell.getCellType() == Cell.CELL_TYPE_STRING ? cell
									.getStringCellValue() : cell
									.getNumericCellValue()));

					switch (cell.getCellType()) {
					case Cell.CELL_TYPE_BOOLEAN:
						LOG.info(cell.getBooleanCellValue() + "\t\t");
						break;
					case Cell.CELL_TYPE_NUMERIC:
						LOG.info(cell.getNumericCellValue() + "\t\t");
						break;
					case Cell.CELL_TYPE_STRING:
						LOG.info(cell.getStringCellValue() + "\t\t");
						break;

					}

				}
				System.out
						.println(" ---------------------------------------------------------------------------------------------- ");
			}
			file.close();

		} catch (FileNotFoundException e) {
			LOG.error(e.getStackTrace());
		} catch (IOException e) {
			LOG.error(e.getStackTrace());
		}
	}

	public void readFromXLSXFile() {

		try {
			FileInputStream file = new FileInputStream(new File(
					"D:\\Asysoi\\База мероприятий\\Report.xlsx"));
			XSSFWorkbook workbook = new XSSFWorkbook(file);
			XSSFSheet sheet = workbook.getSheetAt(0);

			// ....

			file.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
