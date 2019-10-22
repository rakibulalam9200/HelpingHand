package com.helpinghand.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.type.YesNoType;

import com.helpinghand.daoImpl.ManageuserDaoImpl;
import com.helpinghand.model.Admin;
import com.helpinghand.model.Category;
import com.helpinghand.model.Location;
import com.helpinghand.model.User;
import com.helpinghand.serviceImpl.AdminServiceImpl;
import com.helpinghand.serviceImpl.BookpostServiceImpl;
import com.helpinghand.serviceImpl.CategoryServiceImpl;
import com.helpinghand.serviceImpl.LocationServiceImpl;
import com.helpinghand.serviceImpl.MatrialpostServiceImpl;
import com.helpinghand.utils.Formate;
import com.helpinghand.utils.SendEmail;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@WebServlet("/ManageAdmin")
public class ManageAdmin extends HttpServlet {

	private static final long serialVersionUID = 1L;
	java.util.Date date = new Date();
	AdminServiceImpl adminservice = new AdminServiceImpl();
	CategoryServiceImpl categoryservice = new CategoryServiceImpl();
	LocationServiceImpl locationService = new LocationServiceImpl();
	BookpostServiceImpl bookpostServive = new BookpostServiceImpl();
	MatrialpostServiceImpl matrialpostservice = new MatrialpostServiceImpl();
	Formate formate = new Formate();

	//

	//
	ManageuserDaoImpl manageuser = new ManageuserDaoImpl();

	public ManageAdmin() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String getCategoryId = request.getParameter("deleteCategoryPOST");
		String deleteLocationPOST = request.getParameter("deleteLocationPOST");
		String deletebookPOST = request.getParameter("deletebookPOST");
		String deleteMaterialPOST = request.getParameter("deleteMaterialPOST");

		String url = "";
		if (getCategoryId != null) {
			categoryservice.deleteCategory(Integer.parseInt(getCategoryId));
			url = "./admin/viewCategory.jsp";
		} else if (deleteLocationPOST != null) {
			locationService.deletelocation(Integer.parseInt(deleteLocationPOST));
			url = "./admin/viewlocationDetails.jsp";
		} else if (deletebookPOST != null) {
			bookpostServive.deleteBookpost(Integer.parseInt(deletebookPOST));
			url = "./admin/adminViewbooklist.jsp";
		} else if (deleteMaterialPOST != null) {
			matrialpostservice.deleteMateralpost(Integer.parseInt(deleteMaterialPOST));
			url = "./admin/adminviewmatrialpostList.jsp";
		}
		response.sendRedirect(url);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String action = request.getParameter("action");

		System.out.println("hey rakib =" + action);

		if (action.equalsIgnoreCase("SENDEMAIL")) {
			String email = request.getParameter("email");
			String commnet = request.getParameter("comment");
			String error = "";
			String success = "";
			String url = "";
			if (email.equals("") || commnet.equals("")) {
				error += "Field must not be empty!!";
			} else {

				String Info = "From, HelpingHand" + "\n\n";
				Info += "Hey, " + email + " " + "hopefully you are doing well.Thank you so much for contacting us!!"
						+ "\n";
				Info += "If you have any problem.Please contact us" + "\n";
				Info += "Phone: +8801685859200" + "\n";
				Info += "Gmail: rakibul9200@gmail.com";
				SendEmail.send(email, "Contact Info", Info + commnet, "abdurakib777@gmail.com", "diit1089");
				success += "Send your message.Please check your email.";
			}
			if (error.length() > 0) {
				response.sendRedirect("./admin/viewContactDetails.jsp");
			} else {
				response.sendRedirect("./admin/viewContactDetails.jsp");
			}

		} else if (action.equalsIgnoreCase("UpdateCategory")) {

			String categoryname = request.getParameter("categoryname");
			String categorytype = request.getParameter("categorytype");
			String getId = request.getParameter("getId");
			String getEmail = request.getParameter("getEmail");
			categoryservice
					.updateCategory(new Category(Integer.parseInt(getId), categoryname, categorytype, getEmail, date));
			response.sendRedirect("./admin/viewCategory.jsp?error=" + "Update your Info");

		} else if (action.equalsIgnoreCase("UPDATEADMININFO")) {
			String id = request.getParameter("adminId");
			String adminuseremail = request.getParameter("adminname");
			String adminPassword = request.getParameter("adminpassword");
			String adminusername = request.getParameter("username");
			adminservice.updateAdminInfo(
					new Admin(Integer.parseInt(id), adminuseremail, adminusername, adminPassword, date));
			response.sendRedirect("./admin/viewCategory.jsp");

		} else if (action.equalsIgnoreCase("ADDCATEGORY")) {
			String categoryName = request.getParameter("categoryname");
			String categoryType = request.getParameter("categorytype");
			String email = request.getParameter("email");
			categoryservice.addCategory(new Category(0, categoryType, categoryName, email, date));
			response.sendRedirect("./admin/addCategorydetail.jsp");

		} else if (action.equalsIgnoreCase("UpdateLocation")) {

			String locationName = request.getParameter("locationname");
			String locationId = request.getParameter("getId");
			String locationEmail = request.getParameter("getEmail");
			String success = "";
			locationService
					.updatelocation(new Location(Integer.parseInt(locationId), locationName, locationEmail, date));
			success += "Update location Information!!";
			response.sendRedirect("./admin/viewlocationDetails.jsp?success=" + success);

		} else if (action.equalsIgnoreCase("ADDLOCATION")) {
			String locationName = request.getParameter("locationname");
			String sessionname = request.getParameter("sessionname");
			String error = "";
			String success = "";
			if (locationName.equals("")) {
				error += "Field must not be empty!!";
				response.sendRedirect("./admin/addLocationdetail.jsp?error=" + error);
			} else {
				locationService.addLocation(new Location(0, locationName, sessionname, date));
				success += "Add Location!!";
				response.sendRedirect("./admin/addLocationdetail.jsp?success=" + success);
			}

		} else if (action.equalsIgnoreCase("GENERAGEPDF")) {
			Document document = new Document();
			String datetime = new SimpleDateFormat("yyyy.MM.dd").format(new Date());
			Font font = FontFactory.getFont(FontFactory.TIMES_ROMAN, 23);
			Font font1 = FontFactory.getFont(FontFactory.TIMES_ROMAN, 12);
			Font font5 = FontFactory.getFont(FontFactory.TIMES_ROMAN, 11, Font.BOLD);
			Font font6 = FontFactory.getFont(FontFactory.TIMES_ROMAN, 10, Font.NORMAL);
			try {
				response.setContentType("application/pdf");
				PdfWriter.getInstance(document, response.getOutputStream());
				document.open();

				Paragraph paragraph = new Paragraph("Helping Hand", font);
				paragraph.setAlignment(Element.ALIGN_CENTER);
				document.add(paragraph);

				Paragraph address = new Paragraph("Address:102, Shukrabad,Dhanmondi, Dhaka-1207", font1);
				address.setAlignment(Element.ALIGN_CENTER);
				document.add(address);

				Paragraph phone = new Paragraph("phone:098765432123", font1);
				phone.setAlignment(Element.ALIGN_CENTER);
				document.add(phone);

				Paragraph email = new Paragraph("Email:helpinghand@gmail.com", font1);
				email.setAlignment(Element.ALIGN_CENTER);
				document.add(email);

				Paragraph monthlyReport = new Paragraph("User Report", font1);
				monthlyReport.setAlignment(Element.ALIGN_LEFT);
				document.add(monthlyReport);

				Paragraph pargraphdate = new Paragraph("Date: " + datetime, font1);
				pargraphdate.setAlignment(Element.ALIGN_LEFT);
				document.add(pargraphdate);

				float[] pointColumnWidths = { 15F, 18F, 15F };
				PdfPTable table = new PdfPTable(pointColumnWidths);
				table.setSpacingBefore(20);
				table.setWidthPercentage(100f);

				PdfPCell c1 = new PdfPCell(new Phrase("Name", font5));
				c1.setHorizontalAlignment(Element.ALIGN_CENTER);

				table.addCell(c1);

				c1 = new PdfPCell(new Phrase("Email", font5));

				c1.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(c1);

				c1 = new PdfPCell(new Phrase("NID", font5));
				c1.setPaddingBottom(7f);
				c1.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(c1);

				table.setHeaderRows(1);
				c1.setPaddingBottom(10f);
				c1.setHorizontalAlignment(Element.ALIGN_CENTER);

				for (User user : manageuser.getuserList()) {

					PdfPCell cell_1 = new PdfPCell(new Phrase(user.getUserName(), font6));
					cell_1.setPaddingBottom(6f);

					cell_1.setHorizontalAlignment(Element.ALIGN_CENTER);
					PdfPCell cell_2 = new PdfPCell(new Phrase(user.getUserEmail(), font6));
					cell_2.setPaddingBottom(6f);
					cell_2.setHorizontalAlignment(Element.ALIGN_CENTER);
					PdfPCell cell_3 = new PdfPCell(new Phrase(user.getUserNID(), font6));
					cell_3.setHorizontalAlignment(Element.ALIGN_CENTER);
					cell_3.setPaddingBottom(6f);
					table.addCell(cell_1);
					table.addCell(cell_2);
					table.addCell(cell_3);

				}
				document.add(table);
			} catch (Exception e) {
				e.printStackTrace();
			}
			document.close();

		} else {
			System.out.println("not working");
		}
	}

}
