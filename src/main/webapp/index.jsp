<%@ page import="java.util.ResourceBundle" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // Default language
    String selectedLanguage = "en";

    // Check if the language selection is submitted
    String selectedLanguageParam = request.getParameter("language");

    if (selectedLanguageParam != null) {
        selectedLanguage = selectedLanguageParam;
        // Store the selected language in the session
        session.setAttribute("selectedLanguage", selectedLanguage);
    } else {
        // Retrieve the selected language from the session
        Object sessionLanguage = session.getAttribute("selectedLanguage");
        if (sessionLanguage != null) {
            selectedLanguage = (String) sessionLanguage;
        }
    }


    // Load the labels property file based on the selected language
    ResourceBundle labelsBundle = null;
    try {
        if (selectedLanguage.equals("en")) {
            labelsBundle = ResourceBundle.getBundle("en-strings");
        } else if (selectedLanguage.equals("fr")) {
            labelsBundle = ResourceBundle.getBundle("fr-strings");
        } else if (selectedLanguage.equals("es")) {
            labelsBundle = ResourceBundle.getBundle("es-strings");
        } else if (selectedLanguage.equals("de")) {
            labelsBundle = ResourceBundle.getBundle("de-strings");
        } else if (selectedLanguage.equals("pt")) {
            labelsBundle = ResourceBundle.getBundle("pt-strings");
        }
    } catch (Exception e) {
        labelsBundle = ResourceBundle.getBundle("en-strings");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Translation Demo</title>
    <style>
        .label {
            display: inline-block;
            width: 300px; /* Adjust the width as needed */
            text-align: left;
            margin-right: 10px;
        }
    </style>
</head>

<body>
<h3>Translation Demo</h3>
<form action="" method="POST">
    <div>
        <label class="label" for="tc"><%= labelsBundle.getString("transfer-continuation") %>:</label>  <input type="text" id="tc" name="tc">
    </div>
    <div>
        <label class="label" for="pir"><%= labelsBundle.getString("punch-interpretation-rule") %>:</label>  <input type="text" id="pir" name="pir">
    </div>
    <div>
        <label class="label" for="sn"><%= labelsBundle.getString("save-new") %>:</label>  <input type="text" id="sn" name="sn">
    </div>
    <div>
        <label class="label" for="pr"><%= labelsBundle.getString("pay-rule") %>:</label>  <input type="text" id="pr" name="pr">
    </div>
    <div>
    <label class="label" for="ar"><%= labelsBundle.getString("adj-rule") %>:</label>  <input type="text" id="ar" name="ar">
    </div>
    <div>
        <label class="label" for="srs"><%= labelsBundle.getString("sch-rule-set") %>:</label>  <input type="text" id="srs" name="srs">
    </div>
    <div>
        <label class="label" for="pp"><%= labelsBundle.getString("pay-policies") %>:</label>  <input type="text" id="pp" name="pp">
    </div>
    <div>
        <br>
    </div>
    <div>
        <select id="languageSelect" name="language" onchange="changeLanguage()">
            <option value="en" <%= selectedLanguage.equals("en") ? "selected=\"selected\"" : "" %>>English</option>
            <option value="fr" <%= selectedLanguage.equals("fr") ? "selected=\"selected\"" : "" %>>French</option>
            <option value="es" <%= selectedLanguage.equals("es") ? "selected=\"selected\"" : "" %>>Spanish</option>
            <option value="de" <%= selectedLanguage.equals("de") ? "selected=\"selected\"" : "" %>>German</option>
            <option value="pt" <%= selectedLanguage.equals("pt") ? "selected=\"selected\"" : "" %>>Portuguese</option>
        </select>
        <input type="submit" value="Submit">
    </div>
</form>
</body>
</html>
