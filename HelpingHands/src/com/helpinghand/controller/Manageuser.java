package com.helpinghand.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.helpinghand.model.BookPost;
import com.helpinghand.model.ContactInfo;
import com.helpinghand.model.MaterialPost;
import com.helpinghand.model.Messageshopkeeper;
import com.helpinghand.model.User;
import com.helpinghand.serviceImpl.AdminServiceImpl;
import com.helpinghand.serviceImpl.BookpostServiceImpl;
import com.helpinghand.serviceImpl.ContactserviceImpl;
import com.helpinghand.serviceImpl.ManageuserServiceImpl;
import com.helpinghand.serviceImpl.MatrialpostServiceImpl;
import com.helpinghand.serviceImpl.MessageServiceImpl;
import com.helpinghand.utils.Formate;
import com.helpinghand.utils.SendEmail;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
		maxFileSize = 1024 * 1024 * 50, // 50 MB
		maxRequestSize = 1024 * 1024 * 100) // 100 MB
@WebServlet("/Manageuser")
public class Manageuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MatrialpostServiceImpl materialpostservice = new MatrialpostServiceImpl();
	ManageuserServiceImpl userservice = new ManageuserServiceImpl();
	ContactserviceImpl contactservice = new ContactserviceImpl();
	private String date = new SimpleDateFormat("yyyy.MM.dd").format(new Date());
	java.util.Date dateutil = new Date();
	BookpostServiceImpl bookpostservice = new BookpostServiceImpl();
	private static final String UPLOAD_MATRIALS = "uploads/materials";
	private static final String UPLOAD_BOOKPOST = "uploads/bookpost";
	MessageServiceImpl messageservice = new MessageServiceImpl();
	AdminServiceImpl adminService = new AdminServiceImpl();
	Formate formate = new Formate();

	public Manageuser() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String getBookId = request.getParameter("deletebookPOST");
		String getMaterialId = request.getParameter("deleteMaterialPOST");
		String getMessageId = request.getParameter("deleteMesssagePOST");
		String getUserId = request.getParameter("deleteUserPOST");
		String getContactId = request.getParameter("deleteContactPOST");
		String updateMessage=request.getParameter("updateMessage");

		String url = "";
		if (getBookId != null) {
			bookpostservice.deleteBookpost(Integer.parseInt(getBookId));
			url = "viewbookpostList.jsp";
		} else if (getMaterialId != null) {
			materialpostservice.deleteMateralpost(Integer.parseInt(getMaterialId));
			url = "viewmatrialpostList.jsp";
		} else if (getMessageId != null) {
			messageservice.deleteMessage(Integer.parseInt(getMessageId));
			url = "viewMessage.jsp";
		} else if (getUserId != null) {
			userservice.deleteUserInfo(Integer.parseInt(getUserId));
			url = "./admin/viewuserDetails.jsp";

		} else if (getContactId != null) {
			contactservice.deleteContactInfo(Integer.parseInt(getContactId));
			url = "./admin/viewContactDetails.jsp";
			
		} else if (updateMessage != null) {
			contactservice.deleteContactInfo(Integer.parseInt(updateMessage));
			url = "./admin/viewContactDetails.jsp";
			
		}
		response.sendRedirect(url);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String action = request.getParameter("action");

		System.out.println("hellow action" + action);

		if (action.equalsIgnoreCase("USERREGISTRATION")) {
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String nid = request.getParameter("nid");
			String userpassword = request.getParameter("userpassowrd");
			String repassword = request.getParameter("repassword");
			String error = "";
			String success = "";
			String url = "";

			if (userpassword.contentEquals(repassword) == false) {
				error += "Passowrd not match!!";
			} else if (formate.checkPassword(userpassword) == false) {
				error += "Weak password...Password must be greater than 5 character!!";
			} else if (formate.checkNID(nid) == false) {
				error += "Invalid NID";
			} else if (formate.checkNumbervalidator(nid)) {
				error = "All Character Must be in Number Format";
			} else if (formate.checkSpecialcharacter(nid)) {
				error = "Special Character is not allowed";
			} else {
				User user = userservice.checkUser(email);
				if (user == null) {
					userservice.addUser(new User(0, name, email, nid, userpassword, date));
					success += "your registration process is done!!";
				} else {
					error += "Email already exit!!";
				}
			}
			if (error.length() > 0) {
				url = "/registration.jsp";
				request.setAttribute("error", error);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			} else {
				url = "/registration.jsp";
				request.setAttribute("success", success);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}

		} else if (action.equalsIgnoreCase("USER_CONTACT")) {

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String comment = request.getParameter("comment");
			String url = "";
			try {
				contactservice.addContact(new ContactInfo(0, name, email, comment, dateutil));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			url = "/contact.jsp";
			request.setAttribute("success", "Yes add your contactInfo");
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);

		} else if (action.equals("LOGIN")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String error = "";

			if (email.equals("") || password.equals("")) {
				error += "Field must not be empty";
			} else {
				if (userservice.logIn(email, password) == true) {
					HttpSession session = request.getSession();
					session.setAttribute("username", email);
					Cookie loginCookie = new Cookie("username", email);
					loginCookie.setMaxAge(60 * 60);
					response.addCookie(loginCookie);
					response.sendRedirect("viewpost.jsp");

				} else if (adminService.AdminLogIn(email, password) == true) {
					HttpSession session = request.getSession();
					session.setAttribute("adminusername", email);
					Cookie loginCookie = new Cookie("adminusername", email);
					loginCookie.setMaxAge(60 * 60);
					response.addCookie(loginCookie);
					response.sendRedirect("./admin/adminDashboard.jsp");

				} else {
					error += "your email or password not match";
				}
			}

			if (error.length() > 0) {
				request.setAttribute("error", error);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
			}

		} else if (action.equalsIgnoreCase("RESETPASSWORD")) {

			String sendemail = request.getParameter("sendemail");
			String error = "";
			String success = "";
			String url = "";
			if (sendemail.equals("")) {
				error += "Field must not be empty!!";
			} else {
				User user = userservice.checkUser(sendemail);
				if (user == null) {
					error += "Email not match!!";
				} else {
					int rnd = (int) (Math.random() * 100);
					String rndstring = Integer.toString(rnd);
					String getstore = sendemail.substring(0, 4);
					String passwordAssistance = getstore + rndstring;
					String Info = "From, HelpingHand" + "\n\n";
					Info += "Hey, " + sendemail + " "
							+ "hopefully you are doing well.Thank you so much for contacting us!!" + "\n";
					Info += "Your new password: " + passwordAssistance + "\n\n\n";
					Info += "If you have any problem.Please contact us" + "\n";
					Info += "Phone: +88 01858810221" + "\n";
					Info += "Gmail: abdurrakib777@gmail.com";

					userservice.updateUserpassword(new User(passwordAssistance, sendemail));

					SendEmail.send(sendemail, "Forgot Password", Info, "abdurrakib777@gmail.com", "diit1089");
					success += "Send your message.Please check your email.";
				}
			}

			if (error.length() > 0) {
				url = "/forgotpassowrd.jsp";
				request.setAttribute("error", error);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			} else {
				url = "/forgotpassowrd.jsp";
				request.setAttribute("success", success);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}

		} else if (action.equalsIgnoreCase("UPDATEMYPROFILE")) {
			String userpassword = request.getParameter("userpassword");
			String sessionname = request.getParameter("sessionname");
			String nid = request.getParameter("nid");
			String getId = request.getParameter("getId");
			String name = request.getParameter("name");

			System.out.println(userpassword);
			System.out.println(sessionname);
			System.out.println(nid);
			System.out.println(getId);
			System.out.println(name);

			String url = "";
			String error = "";
			String success = "";
			if (userpassword.equals("") || sessionname.equals("")) {
				error += "Field must not be empty";
			} else if (formate.checkNID(nid) == false) {
				error += "Invalid NID!!";
			} else if (formate.checkPassword(userpassword)) {
				error += "Password field must be 5 character!!";
			} else {
				userservice.updateUser(new User(Integer.parseInt(getId), name, sessionname, nid, userpassword, date));
				success += "Update your profile succesfully!!";
			}
			if (error.length() > 0) {
				url = "/updatemyprofile.jsp";
				request.setAttribute("error", error);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			} else {
				url = "/updatemyprofile.jsp";
				request.setAttribute("success", success);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}

		} else if (action.equalsIgnoreCase("ADDMATRIAL")) {

			String sessionname = request.getParameter("sessionname");
			String area = request.getParameter("area");
			String itemname = request.getParameter("itemname");
			String brandname = request.getParameter("brandname");
			String category = request.getParameter("category");
			String radio1 = request.getParameter("radio1");

			String description = request.getParameter("description");
			String radio2 = request.getParameter("radio2");

			String sellprice = request.getParameter("sellprice");

			String itemnameExchange = request.getParameter("itemnameExchange");
			String brandnameExchange = request.getParameter("brandnameExchange");
			String categorynameExchange = request.getParameter("categorynameExchange");
			String exradio1 = request.getParameter("exradio1");
			String contactnumber = request.getParameter("contactnumber");
			String error = "";
			String success = "";
			String url = "";
			if (area.equals("") || itemname.equals("") || brandname.equals("") || category.equals("")
					|| radio1.equals("") || description.equals("") || radio2.equals("") || contactnumber.equals("")) {
				error += "Field must not be empty!!";
			} else if (formate.checkContactNo(contactnumber) == false) {
				error += "Invalid contact number!!";
			} else {

				String applicationPath = request.getServletContext().getRealPath("");
				String uploadFilePath = applicationPath + File.separator + UPLOAD_MATRIALS;
				File fileSaveDir = new File(uploadFilePath);
				if (!fileSaveDir.exists()) {
					fileSaveDir.mkdirs();
				}
				String fileName = null;
				for (Part part : request.getParts()) {
					fileName = getFileName(part);
					fileName = new File(fileName).getName();
					String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
					fileName = timeStamp + ".jpg";
					part.write(uploadFilePath + File.separator + fileName);
				}

				if (radio2.equals("Donate")) {
					materialpostservice.addMaterialpost(new MaterialPost(1000, sessionname, area, itemname, brandname,
							category, radio1, description, radio2, contactnumber, fileName, "blank", "blank", "blank",
							"blank", 0, true, date));
					success += "Add your post succsssfully!!";
				} else if (radio2.equals("Exchange")) {
					if (itemnameExchange.equals("") || brandnameExchange.equals("") || categorynameExchange.equals("")
							|| exradio1.equals("")) {
						error += "Exchange field must not be empty!!";
					} else {
						materialpostservice.addMaterialpost(new MaterialPost(0, sessionname, area, itemname, brandname,
								category, radio1, description, radio2, contactnumber, fileName, itemnameExchange,
								brandnameExchange, categorynameExchange, exradio1, 0, true, date));

						success += "Add your post succsssfully!!";
					}
				} else if (radio2.equals("Sell")) {
					if (sellprice.equals("")) {
						error += "Sells filed must not be empty!!";
					} else {
						materialpostservice.addMaterialpost(new MaterialPost(0, sessionname, area, itemname, brandname,
								category, radio1, description, radio2, contactnumber, fileName, "blank", "blank",
								"blank", "blank", Integer.parseInt(sellprice), true, date));
						success += "Add your post succsssfully!!";
					}
				}

			}

			if (error.length() > 0) {
				url = "/materrialspost.jsp";
				request.setAttribute("error", error);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			} else {
				url = "/materrialspost.jsp";
				request.setAttribute("success", success);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}

		} else if (action.equalsIgnoreCase("ADDadminMATRIAL")) {

			String sessionname = request.getParameter("sessionname");
			String area = request.getParameter("area");
			String itemname = request.getParameter("itemname");
			String brandname = request.getParameter("brandname");
			String category = request.getParameter("category");
			String radio1 = request.getParameter("radio1");

			String description = request.getParameter("description");
			String radio2 = request.getParameter("radio2");

			String sellprice = request.getParameter("sellprice");

			String itemnameExchange = request.getParameter("itemnameExchange");
			String brandnameExchange = request.getParameter("brandnameExchange");
			String categorynameExchange = request.getParameter("categorynameExchange");
			String exradio1 = request.getParameter("exradio1");
			String contactnumber = request.getParameter("contactnumber");
			String error = "";
			String success = "";
			String url = "";
			if (area.equals("") || itemname.equals("") || brandname.equals("") || category.equals("")
					|| radio1.equals("") || description.equals("") || radio2.equals("") || contactnumber.equals("")) {
				error += "Field must not be empty!!";
			} else if (formate.checkContactNo(contactnumber) == false) {
				error += "Invalid contact number!!";
			} else {

				String applicationPath = request.getServletContext().getRealPath("");
				String uploadFilePath = applicationPath + File.separator + UPLOAD_MATRIALS;
				File fileSaveDir = new File(uploadFilePath);
				if (!fileSaveDir.exists()) {
					fileSaveDir.mkdirs();
				}
				String fileName = null;
				for (Part part : request.getParts()) {
					fileName = getFileName(part);
					fileName = new File(fileName).getName();
					String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
					fileName = timeStamp + ".jpg";
					part.write(uploadFilePath + File.separator + fileName);
				}

				if (radio2.equals("Donate")) {
					materialpostservice.addMaterialpost(new MaterialPost(1000, sessionname, area, itemname, brandname,
							category, radio1, description, radio2, contactnumber, fileName, "blank", "blank", "blank",
							"blank", 0, true, date));
					success += "Add your post succsssfully!!";
				} else if (radio2.equals("Exchange")) {
					if (itemnameExchange.equals("") || brandnameExchange.equals("") || categorynameExchange.equals("")
							|| exradio1.equals("")) {
						error += "Exchange field must not be empty!!";
					} else {
						materialpostservice.addMaterialpost(new MaterialPost(0, sessionname, area, itemname, brandname,
								category, radio1, description, radio2, contactnumber, fileName, itemnameExchange,
								brandnameExchange, categorynameExchange, exradio1, 0, true, date));

						success += "Add your post succsssfully!!";
					}
				} else if (radio2.equals("Sell")) {
					if (sellprice.equals("")) {
						error += "Sells filed must not be empty!!";
					} else {
						materialpostservice.addMaterialpost(new MaterialPost(0, sessionname, area, itemname, brandname,
								category, radio1, description, radio2, contactnumber, fileName, "blank", "blank",
								"blank", "blank", Integer.parseInt(sellprice), true, date));
						success += "Add your post succsssfully!!";
					}
				}

			}

			if (error.length() > 0) {

				response.sendRedirect("./admin/adminmaterrialspost.jsp?error=" + error);

			} else {

				response.sendRedirect("./admin/adminmaterrialspost.jsp?success=" + success);
			}

		} else if (action.equalsIgnoreCase("ADDBOOKPOST")) {

			String sessionname = request.getParameter("sessionname");
			String area = request.getParameter("area");
			String bookname = request.getParameter("bookname");
			String authorname = request.getParameter("authorname");
			String publishername = request.getParameter("publishername");
			String category = request.getParameter("category");
			String radio1 = request.getParameter("radio1");
			String description = request.getParameter("description");
			String radio2 = request.getParameter("radio2");

			String exchangebookname = request.getParameter("exchangebookname");
			String exchangeauthorname = request.getParameter("exchangeauthorname");
			String exchangepublishername = request.getParameter("exchangepublishername");
			String exchangecategory = request.getParameter("exchangecategory");
			String exradio3 = request.getParameter("radio3");

			String contactnumber = request.getParameter("contactnumber");

			String sellingprice = request.getParameter("sellingprice");

			String error = "";
			String success = "";
			String url = "";

			if (area.equals("") || bookname.equals("") || authorname.equals("") || publishername.equals("")
					|| category.equals("") || radio1.equals("") || description.equals("") || radio2.equals("")
					|| contactnumber.equals("")) {
				error += "Field must not be empty!!";
			} else if (formate.checkContactNo(contactnumber) == false) {
				error += "Invalid contact number!!";
			} else {
				String applicationPath = request.getServletContext().getRealPath("");
				String uploadFilePath = applicationPath + File.separator + UPLOAD_BOOKPOST;
				File fileSaveDir = new File(uploadFilePath);
				if (!fileSaveDir.exists()) {
					fileSaveDir.mkdirs();
				}
				String fileName = null;
				for (Part part : request.getParts()) {
					fileName = getFileName(part);
					fileName = new File(fileName).getName();
					String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
					fileName = timeStamp + ".jpg";
					part.write(uploadFilePath + File.separator + fileName);
				}

				if (radio2.equals("Donate")) {
					bookpostservice.addBookpost(new BookPost(0, sessionname, area, bookname, authorname, publishername,
							category, radio1, description, contactnumber, radio2, fileName, "blank", "blank", "blank",
							"blank", "blank", "blank", true, date));
					success += "Add your post succsssfully!!";
				} else if (radio2.equals("Exchange")) {
					if (exchangebookname.equals("") || exchangeauthorname.equals("") || exchangepublishername.equals("")
							|| exchangecategory.equals("") || exradio3.equals("")) {
						error += "Exchange field must not be empty!!";
					} else {
						bookpostservice.addBookpost(new BookPost(0, sessionname, area, bookname, authorname,
								publishername, category, radio1, description, contactnumber, radio2, fileName,
								exchangebookname, exchangeauthorname, exchangepublishername, exchangecategory, exradio3,
								"blank", true, date));
						success += "Add your post succsssfully!!";
					}
				} else if (radio2.equals("Sell")) {
					if (sellingprice.equals("")) {
						error += "Sells filed must not be empty!!";
					} else {
						bookpostservice.addBookpost(new BookPost(0, sessionname, area, bookname, authorname,
								publishername, category, radio1, description, contactnumber, radio2, fileName, "blank",
								"blank", "blank", "blank", "blank", sellingprice, true, date));
						success += "Add your post succsssfully!!";
					}
				}

			}
			if (error.length() > 0) {
				url = "/bookpost.jsp";
				request.setAttribute("error", error);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			} else {
				url = "/bookpost.jsp";
				request.setAttribute("success", success);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}

		} else if (action.equalsIgnoreCase("ADDMIDBOOKPOST")) {
			String sessionname = request.getParameter("sessionname");
			String area = request.getParameter("area");
			String bookname = request.getParameter("bookname");
			String authorname = request.getParameter("authorname");
			String publishername = request.getParameter("publishername");
			String category = request.getParameter("category");
			String radio1 = request.getParameter("radio1");
			String description = request.getParameter("description");
			String radio2 = request.getParameter("radio2");

			String exchangebookname = request.getParameter("exchangebookname");
			String exchangeauthorname = request.getParameter("exchangeauthorname");
			String exchangepublishername = request.getParameter("exchangepublishername");
			String exchangecategory = request.getParameter("exchangecategory");
			String exradio3 = request.getParameter("radio3");

			String contactnumber = request.getParameter("contactnumber");

			String sellingprice = request.getParameter("sellingprice");

			String error = "";
			String success = "";
			String url = "";

			if (area.equals("") || bookname.equals("") || authorname.equals("") || publishername.equals("")
					|| category.equals("") || radio1.equals("") || description.equals("") || radio2.equals("")
					|| contactnumber.equals("")) {
				error += "Field must not be empty!!";
			} else if (formate.checkContactNo(contactnumber) == false) {
				error += "Invalid contact number!!";
			} else {
				String applicationPath = request.getServletContext().getRealPath("");
				String uploadFilePath = applicationPath + File.separator + UPLOAD_BOOKPOST;
				File fileSaveDir = new File(uploadFilePath);
				if (!fileSaveDir.exists()) {
					fileSaveDir.mkdirs();
				}
				String fileName = null;
				for (Part part : request.getParts()) {
					fileName = getFileName(part);
					fileName = new File(fileName).getName();
					String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
					fileName = timeStamp + ".jpg";
					part.write(uploadFilePath + File.separator + fileName);
				}

				if (radio2.equals("Donate")) {
					bookpostservice.addBookpost(new BookPost(0, sessionname, area, bookname, authorname, publishername,
							category, radio1, description, contactnumber, radio2, fileName, "blank", "blank", "blank",
							"blank", "blank", "blank", true, date));
					success += "Add your post succsssfully!!";
				} else if (radio2.equals("Exchange")) {
					if (exchangebookname.equals("") || exchangeauthorname.equals("") || exchangepublishername.equals("")
							|| exchangecategory.equals("") || exradio3.equals("")) {
						error += "Exchange field must not be empty!!";
					} else {
						bookpostservice.addBookpost(new BookPost(0, sessionname, area, bookname, authorname,
								publishername, category, radio1, description, contactnumber, radio2, fileName,
								exchangebookname, exchangeauthorname, exchangepublishername, exchangecategory, exradio3,
								"blank", true, date));
						success += "Add your post succsssfully!!";
					}
				} else if (radio2.equals("Sell")) {
					if (sellingprice.equals("")) {
						error += "Sells filed must not be empty!!";
					} else {
						bookpostservice.addBookpost(new BookPost(0, sessionname, area, bookname, authorname,
								publishername, category, radio1, description, contactnumber, radio2, fileName, "blank",
								"blank", "blank", "blank", "blank", sellingprice, true, date));
						success += "Add your post succsssfully!!";
					}
				}

			}
			if (error.length() > 0) {

				response.sendRedirect("./admin/adminViewbooklist.jsp?error=" + error);

			} else {

				response.sendRedirect("./admin/adminViewbooklist.jsp?success=" + success);
			}

		} else if (action.equalsIgnoreCase("UPDATEBOOKPOST")) {

			String sessionname = request.getParameter("sessionname");
			String area = request.getParameter("area");
			String bookname = request.getParameter("bookname");
			String authorname = request.getParameter("authorname");
			String publishername = request.getParameter("publishername");
			String category = request.getParameter("category");
			String radio1 = request.getParameter("radio1");
			String description = request.getParameter("description");
			String radio2 = request.getParameter("radio2");

			String exchangebookname = request.getParameter("exchangebookname");
			String exchangeauthorname = request.getParameter("exchangeauthorname");
			String exchangepublishername = request.getParameter("exchangepublishername");
			String exchangecategory = request.getParameter("exchangecategory");
			String exradio3 = request.getParameter("radio3");

			String contactnumber = request.getParameter("contactnumber");
			String fileName = request.getParameter("fileName");
			String sellingprice = request.getParameter("sellingprice");

			String getId = request.getParameter("getId");
			String confirm = request.getParameter("confirm");
			boolean checkcondition = Boolean.getBoolean(confirm);

			String error = "";
			String success = "";
			String url = "";

			if (area.equals("") || bookname.equals("") || authorname.equals("") || publishername.equals("")
					|| category.equals("") || radio1.equals("") || description.equals("") || radio2.equals("")
					|| contactnumber.equals("")) {
				error += "Field must not be empty!!";
			} else if (formate.checkContactNo(contactnumber) == false) {
				error += "Invalid contact number!!";
			} else {

				if (radio2.equals("Donate")) {
					bookpostservice.updateBookpostInfo(new BookPost(Integer.parseInt(getId), sessionname, area,
							bookname, authorname, publishername, category, radio1, description, contactnumber, radio2,
							fileName, "blank", "blank", "blank", "blank", "blank", "blank", checkcondition, date));

					success += "Add your post succsssfully!!";
				} else if (radio2.equals("Exchange")) {
					if (exchangebookname.equals("") || exchangeauthorname.equals("") || exchangepublishername.equals("")
							|| exchangecategory.equals("") || exradio3.equals("")) {
						error += "Exchange field must not be empty!!";
					} else {
						bookpostservice.updateBookpostInfo(new BookPost(Integer.parseInt(getId), sessionname, area,
								bookname, authorname, publishername, category, radio1, description, contactnumber,
								radio2, fileName, exchangebookname, exchangeauthorname, exchangepublishername,
								exchangecategory, exradio3, "blank", checkcondition, date));
						success += "Update your post succsssfully!!";
					}
				} else if (radio2.equals("Sell")) {
					if (sellingprice.equals("")) {
						error += "Sells filed must not be empty!!";
					} else {
						bookpostservice.updateBookpostInfo(new BookPost(Integer.parseInt(getId), sessionname, area,
								bookname, authorname, publishername, category, radio1, description, contactnumber,
								radio2, fileName, "blank", "blank", "blank", "blank", "blank", sellingprice,
								checkcondition, date));
						success += "Update your post succsssfully!!";
					}
				}
			}

			if (error.length() > 0) {
				url = "/viewbookpostList.jsp";
				request.setAttribute("error", error);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			} else {
				url = "/viewbookpostList.jsp";
				request.setAttribute("success", success);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}

		} else if (action.equalsIgnoreCase("ADMINUPDATEBOOKPOST")) {

			String sessionname = request.getParameter("sessionname");
			String area = request.getParameter("area");
			String bookname = request.getParameter("bookname");
			String authorname = request.getParameter("authorname");
			String publishername = request.getParameter("publishername");
			String category = request.getParameter("category");
			String radio1 = request.getParameter("radio1");
			String description = request.getParameter("description");
			String radio2 = request.getParameter("radio2");

			String exchangebookname = request.getParameter("exchangebookname");
			String exchangeauthorname = request.getParameter("exchangeauthorname");
			String exchangepublishername = request.getParameter("exchangepublishername");
			String exchangecategory = request.getParameter("exchangecategory");
			String exradio3 = request.getParameter("radio3");

			String contactnumber = request.getParameter("contactnumber");
			String fileName = request.getParameter("fileName");
			String sellingprice = request.getParameter("sellingprice");

			String getId = request.getParameter("getId");
			String confirm = request.getParameter("confirm");
			boolean checkcondition = Boolean.getBoolean(confirm);

			String error = "";
			String success = "";
			String url = "";

			if (area.equals("") || bookname.equals("") || authorname.equals("") || publishername.equals("")
					|| category.equals("") || radio1.equals("") || description.equals("") || radio2.equals("")
					|| contactnumber.equals("")) {
				error += "Field must not be empty!!";
			} else if (formate.checkContactNo(contactnumber) == false) {
				error += "Invalid contact number!!";
			} else {

				if (radio2.equals("Donate")) {
					bookpostservice.updateBookpostInfo(new BookPost(Integer.parseInt(getId), sessionname, area,
							bookname, authorname, publishername, category, radio1, description, contactnumber, radio2,
							fileName, "blank", "blank", "blank", "blank", "blank", "blank", checkcondition, date));

					success += "Add your post succsssfully!!";
				} else if (radio2.equals("Exchange")) {
					if (exchangebookname.equals("") || exchangeauthorname.equals("") || exchangepublishername.equals("")
							|| exchangecategory.equals("") || exradio3.equals("")) {
						error += "Exchange field must not be empty!!";
					} else {
						bookpostservice.updateBookpostInfo(new BookPost(Integer.parseInt(getId), sessionname, area,
								bookname, authorname, publishername, category, radio1, description, contactnumber,
								radio2, fileName, exchangebookname, exchangeauthorname, exchangepublishername,
								exchangecategory, exradio3, "blank", checkcondition, date));
						success += "Update your post succsssfully!!";
					}
				} else if (radio2.equals("Sell")) {
					if (sellingprice.equals("")) {
						error += "Sells filed must not be empty!!";
					} else {
						bookpostservice.updateBookpostInfo(new BookPost(Integer.parseInt(getId), sessionname, area,
								bookname, authorname, publishername, category, radio1, description, contactnumber,
								radio2, fileName, "blank", "blank", "blank", "blank", "blank", sellingprice,
								checkcondition, date));
						success += "Update your post succsssfully!!";
					}
				}
			}
			if (error.length() > 0) {
				response.sendRedirect("./admin/adminViewbooklist.jsp?error=" + error);
			} else {
				response.sendRedirect("./admin/adminViewbooklist.jsp?success=" + success);
			}

		} else if (action.equalsIgnoreCase("UPDATEMATERIALPOST")) {
			String sessionname = request.getParameter("sessionname");
			String area = request.getParameter("area");
			String itemname = request.getParameter("itemname");
			String brandname = request.getParameter("brandname");
			String category = request.getParameter("category");
			String radio1 = request.getParameter("radio1");

			String description = request.getParameter("description");
			String radio2 = request.getParameter("radio2");

			String sellprice = request.getParameter("sellprice");

			String itemnameExchange = request.getParameter("itemnameExchange");
			String brandnameExchange = request.getParameter("brandnameExchange");
			String categorynameExchange = request.getParameter("categorynameExchange");
			String exradio1 = request.getParameter("exradio1");
			String contactnumber = request.getParameter("contactnumber");

			String getId = request.getParameter("getId");
			String fileName = request.getParameter("fileName");

			String confirm = request.getParameter("confirm");
			boolean checkcondition = Boolean.getBoolean(confirm);

			String error = "";
			String success = "";
			String url = "";
			if (area.equals("") || itemname.equals("") || brandname.equals("") || category.equals("")
					|| radio1.equals("") || description.equals("") || radio2.equals("") || contactnumber.equals("")) {
				error += "Field must not be empty!!";
			} else if (formate.checkContactNo(contactnumber) == false) {
				error += "Invalid contact number!!";
			} else {
				if (radio2.equals("Donate")) {

					materialpostservice.updateMaterialpostInfo(new MaterialPost(Integer.parseInt(getId), sessionname,
							area, itemname, brandname, category, radio1, description, radio2, contactnumber, fileName,
							"blank", "blank", "blank", "blank", 0, checkcondition, date));
					success += "Update your post succsssfully!!";
				} else if (radio2.equals("Exchange")) {
					if (itemnameExchange.equals("") || brandnameExchange.equals("") || categorynameExchange.equals("")
							|| exradio1.equals("")) {
						error += "Exchange field must not be empty!!";
					} else {
						materialpostservice.updateMaterialpostInfo(new MaterialPost(Integer.parseInt(getId),
								sessionname, area, itemname, brandname, category, radio1, description, radio2,
								contactnumber, fileName, itemnameExchange, brandnameExchange, categorynameExchange,
								exradio1, 0, checkcondition, date));
						success += "Update your post succsssfully!!";
					}
				} else if (radio2.equals("Sell")) {
					if (sellprice.equals("")) {
						error += "Sells filed must not be empty!!";
					} else {
						materialpostservice.updateMaterialpostInfo(
								new MaterialPost(Integer.parseInt(getId), sessionname, area, itemname, brandname,
										category, radio1, description, radio2, contactnumber, fileName, "blank",
										"blank", "blank", "blank", Integer.parseInt(sellprice), checkcondition, date));
						success += "Update your post succsssfully!!";
					}
				}
			}

			if (error.length() > 0) {
				url = "/viewmatrialpostList.jsp";
				request.setAttribute("error", error);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			} else {
				url = "/viewmatrialpostList.jsp";
				request.setAttribute("success", success);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}

		} else if (action.equalsIgnoreCase("ADMINUPDATEMATERIALPOST")) {

			String sessionname = request.getParameter("sessionname");
			String area = request.getParameter("area");
			String itemname = request.getParameter("itemname");
			String brandname = request.getParameter("brandname");
			String category = request.getParameter("category");
			String radio1 = request.getParameter("radio1");

			String description = request.getParameter("description");
			String radio2 = request.getParameter("radio2");

			String sellprice = request.getParameter("sellprice");

			String itemnameExchange = request.getParameter("itemnameExchange");
			String brandnameExchange = request.getParameter("brandnameExchange");
			String categorynameExchange = request.getParameter("categorynameExchange");
			String exradio1 = request.getParameter("exradio1");
			String contactnumber = request.getParameter("contactnumber");

			String getId = request.getParameter("getId");
			String fileName = request.getParameter("fileName");

			String confirm = request.getParameter("confirm");
			boolean checkcondition = Boolean.getBoolean(confirm);

			String error = "";
			String success = "";
			String url = "";
			if (area.equals("") || itemname.equals("") || brandname.equals("") || category.equals("")
					|| radio1.equals("") || description.equals("") || radio2.equals("") || contactnumber.equals("")) {
				error += "Field must not be empty!!";
			} else if (formate.checkContactNo(contactnumber) == false) {
				error += "Invalid contact number!!";
			} else {
				if (radio2.equals("Donate")) {

					materialpostservice.updateMaterialpostInfo(new MaterialPost(Integer.parseInt(getId), sessionname,
							area, itemname, brandname, category, radio1, description, radio2, contactnumber, fileName,
							"blank", "blank", "blank", "blank", 0, checkcondition, date));
					success += "Update your post succsssfully!!";
				} else if (radio2.equals("Exchange")) {
					if (itemnameExchange.equals("") || brandnameExchange.equals("") || categorynameExchange.equals("")
							|| exradio1.equals("")) {
						error += "Exchange field must not be empty!!";
					} else {
						materialpostservice.updateMaterialpostInfo(new MaterialPost(Integer.parseInt(getId),
								sessionname, area, itemname, brandname, category, radio1, description, radio2,
								contactnumber, fileName, itemnameExchange, brandnameExchange, categorynameExchange,
								exradio1, 0, checkcondition, date));
						success += "Update your post succsssfully!!";
					}
				} else if (radio2.equals("Sell")) {
					if (sellprice.equals("")) {
						error += "Sells filed must not be empty!!";
					} else {
						materialpostservice.updateMaterialpostInfo(
								new MaterialPost(Integer.parseInt(getId), sessionname, area, itemname, brandname,
										category, radio1, description, radio2, contactnumber, fileName, "blank",
										"blank", "blank", "blank", Integer.parseInt(sellprice), checkcondition, date));
						success += "Update your post succsssfully!!";
					}
				}
			}

			if (error.length() > 0) {
				response.sendRedirect("./admin/adminviewmatrialpostList.jsp?error=" + error);
			} else {
				response.sendRedirect("./admin/adminviewmatrialpostList.jsp?success=" + success);
			}

		} else if (action.equalsIgnoreCase("CONTACT_US")) {
			String email = request.getParameter("email");
			String comment = request.getParameter("comment");
			String postuseremail = request.getParameter("postuseremail");
			String postId = request.getParameter("postId");
			
			System.out.println(email);
			System.out.println(comment);
			System.out.println(postuseremail);
			System.out.println(postId);
			
			
			
			messageservice.addMessage(
					new Messageshopkeeper(0, Integer.parseInt(postId), postuseremail, email, comment, 1, dateutil));

		} else if (action.equalsIgnoreCase("SEARCH")) {

			String searchvalue = request.getParameter("searchvalue");

			response.sendRedirect("searchbyproductName.jsp?searchValue=" + searchvalue);

		} else {
			System.out.println("not working");
		}

	}

	private String getFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] tokens = contentDisp.split(";");
		for (String token : tokens) {
			if (token.trim().startsWith("fileName")) {
				return token.substring(token.indexOf("=") + 2, token.length() - 1);
			}
		}
		return "";
	}

}