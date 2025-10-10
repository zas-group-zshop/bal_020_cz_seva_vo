<html> 
<head> 
  <title>E-Shop Beneš a Lát a.s.</title> 
  <meta name="keywords" content="hračky, váhy, vista, seva, monti, stavebnice, mozaiky, hry" /> 
  <meta name="description" content="hračky, váhy, vista, seva, monti, stavebnice, mozaiky, hry" /> 
  <meta http-equiv="Content-Type" content="text/html; charset=windows-1250" /> 
</head> 

<%
Dim mail
Set mail = Server.CreateObject("CDO.Message")
mail.To = "eshop@vista.cz"
mail.From = "formularproskolky@vista.cz"
mail.Subject = "Zpráva z formuláře pro školky"

Dim Body
Body = "Název: " + Request.Form("nazev") + vbCrLF 
Body = Body + "Ulice: " + Request.Form("ulice") + vbCrLF 
Body = Body + "Č.p.: " + Request.Form("cp") + vbCrLF 
Body = Body + "Město: " + Request.Form("mesto") + vbCrLF 
Body = Body + "Psč: " + Request.Form("psc") + vbCrLF 
Body = Body + "IČ: " + Request.Form("ic") + vbCrLF 
Body = Body + "DIČ: " + Request.Form("dic") + vbCrLF 
Body = Body + "Tel.: " + Request.Form("tel") + vbCrLF 
Body = Body + "Email: " + Request.Form("email") + vbCrLF 
Body = Body + "Www: " + Request.Form("www") + vbCrLF 
Body = Body + "Jméno: " + Request.Form("jmeno") + vbCrLF 
Body = Body + "Příjmení: " + Request.Form("prijmeni") + vbCrLF 
Body = Body + "Tel.: " + Request.Form("tel2") + vbCrLF 
Body = Body + "Email: " + Request.Form("From") + vbCrLF 
Body = Body + "Počet tříd: " + Request.Form("trid") + vbCrLF 
Body = Body + "Počet učitelů: " + Request.Form("ucitelu") + vbCrLF 
Body = Body + "Počet žáků: " + Request.Form("zaku") + vbCrLF 
Body = Body + "Počet chlapců: " + Request.Form("chlapcu") + vbCrLF 
Body = Body + "Ve věku od: " + Request.Form("od") + "  do: " + Request.Form("do") + vbCrLF 
Body = Body + "Aktivity: " + Request.Form("aktivity") + vbCrLF 

Body = Body + "Browser: " + Request.ServerVariables( "HTTP_USER_AGENT" ) + vbCrLF + vbCrLF
Body = Body + "IP adresa: " + Request.ServerVariables( "REMOTE_ADDR" )

mail.TextBody = Body
mail.TextBodyPart.Charset = "windows-1250"
mail.TextBodyPart.ContentTransferEncoding = "quoted-printable"

mail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
mail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "82.142.83.196"
mail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
mail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 240
mail.Configuration.Fields.Update

mail.Send()

Response.Write("<center><b>Mail byl odeslán !</b><br><br><form method=" & chr(34) & "post" & chr(34) & "><input type=" & chr(34) & "button" & chr(34) & " value=" & chr(34) & "Návrat do eshopu" & chr(34) & " onclick=" & chr(34) & "window.close();" & chr(34) & "></form></center>")
Set mail = nothing
%>
