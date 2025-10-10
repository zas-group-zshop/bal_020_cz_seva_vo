<%@ Page Language="C#" MasterPageFile="~/ZASshop.Master" AutoEventWireup="true" CodeBehind="Basket.aspx.cs" Inherits="ZASshop.NET.Basket" EnableViewState="false" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ZasShopBodyPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnBasketExport" />
            <asp:PostBackTrigger ControlID="btnBasketPrint" />
        </Triggers>
        <ContentTemplate>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div class="dynamicPopulate_Updating">
                        
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>

			<!-- shoppingCart -->
			<div class="shoppingCart">
                <!-- pageDesc -->
                <div class="pageDesc">
                    <h1 class="h1"><asp:Literal ID="lBasketTitle" runat="server" Text="<%$ Resources: Resource, BasketTitle %>" /></h1>
                    <asp:Panel ID="pDescription" runat="server">
                        <p><asp:Label ID="lBasketDescriptionTop" runat="server" Text="" /></p>
                        <p><asp:Literal ID="lBasketIsEmpty" runat="server" Text="<%$ Resources: Resource, BasketIsEmpty %>" Visible="false" /></p>
                    </asp:Panel>
                </div>
                <!-- /pageDesc -->

                <asp:Panel ID="BasketBodyPanel" runat="server">

                    <div class="table-responsive">
                        <table class="table table-condensed table-striped table-bordered table-cart">

                            <thead>
                                <tr>
                                    <th><asp:Literal ID="lThBasketNomenName" runat="server" Text="<%$ Resources: Resource, BasketNomenName %>" /></th>
                                    <th><asp:Literal ID="lThBasketStockState" runat="server" Text="<%$ Resources: Resource, BasketStockState %>" /></th>
                                    <th><asp:Literal ID="lThBasketParams" runat="server" Text="<%$ Resources: Resource, BasketParams %>" /></th>
                                    <th class='alignRight <%# String.IsNullOrEmpty(ZASutility.MyUtility.GetSession("e_mail")) ? "hide-control" : "" %>'><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: Resource, Weight %>" /></th>
                                    <th><asp:Literal ID="lThBasketQty" runat="server" Text="<%$ Resources: Resource, BasketQty %>" /></th>
                                    <th class="alignRight"><asp:Literal ID="lThBasketPriceNoDph" runat="server" Text="<%$ Resources: Resource, BasketPriceNoDph %>" /></th>
                                    <th class="alignRight"><asp:Literal ID="lThBasketPriceWithDph" runat="server" Text="<%$ Resources: Resource, BasketPriceWithDph %>" /></th>
                                    <th />
                                </tr>
                            </thead>
                            <tbody>

                                <asp:Repeater ID="rBasketTable" runat="server"
                                    OnItemCommand="rBasketTable_ItemCommand" OnItemDataBound="rBasketTable_ItemDataBound" >
                                    <ItemTemplate>
    									    <tr class="product">
    											    <td><a href="<%# DataBinder.Eval(Container.DataItem, "web_items_url") %>"><%# DataBinder.Eval(Container.DataItem, "nazev") %></a></td>
    											    <td>
    												    <div class="avail"><%# DataBinder.Eval(Container.DataItem, "web_items_stav_skladu") %></div>
    											    </td>
    											    <td>
    												    <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "atribut_1").ToString()) ? "<div><b>" + DataBinder.Eval(Container.DataItem, "atribut_1_nazev") + "</b>: " + DataBinder.Eval(Container.DataItem, "atribut_1") + "</div>" : "" %>
    												    <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "atribut_2").ToString()) ? "<div><b>" + DataBinder.Eval(Container.DataItem, "atribut_2_nazev") + "</b>: " + DataBinder.Eval(Container.DataItem, "atribut_2") + "</div>" : "" %>
    												    <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "atribut_3").ToString()) ? "<div><b>" + DataBinder.Eval(Container.DataItem, "atribut_3_nazev") + "</b>: " + DataBinder.Eval(Container.DataItem, "atribut_3") + "</div>" : "" %>
    											    </td>
                                                    <td class='alignRight <%# String.IsNullOrEmpty(ZASutility.MyUtility.GetSession("e_mail")) ? "hide-control" : "" %>'><%# Math.Round((decimal)ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "brutto_celkem"),2) %> <span class="text-lowercase"> Kg</span></td>
    											    <td>
    												    <div class="tools">
    													    <asp:HiddenField ID="hfBasketId" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id") %>' />
    													    <asp:HiddenField ID="hfCena" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "cena") %>' />
    													    <asp:HiddenField ID="hfDph" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "dph_anone") %>' />
    													    <asp:HiddenField ID="hfSazbaDph" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "sazba_dph") %>' />
    													    <asp:HiddenField ID="hfKoeficientDph" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "koeficient") %>' />
    													    <asp:HiddenField ID="hfIdMeny" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id_meny") %>' />
                                                            <asp:TextBox ID="tbQuantity" runat="server" CssClass="form-control input-sm" Text='<%# ZASutility.MyUtility.StringToInt(DataBinder.Eval(Container.DataItem, "mnozstvi").ToString()) %>' MaxLength="5" AutoPostBack="false" OnTextChanged="tbQuantity_TextChanged" />
                                                            <span class="_mj text-lowercase"> <%# DataBinder.Eval(Container.DataItem, "mj") %> </span>
                                                        </div>
    											    </td>
    											    <td>
                                                        <span class="price">
                                                            <asp:Literal ID="lPriceWithoutDph" runat="server"></asp:Literal>
                                                            <asp:Literal ID="lPriceWithoutDphIdMeny" runat="server"></asp:Literal>
                                                        </span>
                                                    </td>
    											    <td>
                                                        <span class="price">
                                                            <asp:Literal ID="lPriceWithDph" runat="server"></asp:Literal>
                                                            <asp:Literal ID="lPriceWithDphIdMeny" runat="server"></asp:Literal>
                                                        </span>
                                                    </td>
    											    <td class="text-center">
                                                        <asp:Button ID="Button1" runat="server" Text="X" CssClass="button btn btn-basic btn-sm" CommandName="DeleteItem" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>' ToolTip="<%$ Resources: Resource, BasketDeleteItem %>" />
    											    </td>
    										    </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot class="cart-sum-price">
                                <tr class="product sumPrice">
                                    <td colspan="4"><asp:Literal ID="Literal7" runat="server" Text="<%$ Resources: Resource, BasketSummary %>" />:</td>
                                    <td class='alignRight <%# String.IsNullOrEmpty(ZASutility.MyUtility.GetSession("e_mail")) ? "hide-control" : "" %>'></td>
                                    <td>
                                        <span class="price">
                                            <asp:Literal ID="lSummaryPriceWithoutDph" runat="server"></asp:Literal>
                                            <asp:Literal ID="lSummaryPriceWithoutDphIdMeny" runat="server"></asp:Literal>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="price">
                                            <asp:Literal ID="lSummaryPriceWithDph" runat="server"></asp:Literal>
                                            <asp:Literal ID="lSummaryPriceWithDphIdMeny" runat="server"></asp:Literal>
                                        </span>
                                    </td>
                                    <td></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>

                    <!-- pageDesc -->
                    <div class="pageDesc">
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:PlaceHolder ID="phBasketBrutto" runat="server"></asp:PlaceHolder>
                            <p><asp:Label ID="lBasketDescriptionBottom" runat="server" Text="" /></p>
                        </asp:Panel>
                    </div>
                    <!-- /pageDesc -->

                </asp:Panel>
            </div><!-- /shoppingCart -->
						
			<!-- cartButtons -->
            <asp:Panel ID="BasketControlsPanel" runat="server" CssClass="cartButtons cart-buttons">
                <asp:Button ID="btnAdvanced"     runat="server" CssClass="button btn btn-default" Text="<%$ Resources: Resource, BasketAdvTitle %>" Visible="false" Enabled="false" />
                <asp:HoverMenuExtender ID="hme2" runat="Server" Enabled="false" TargetControlID="btnAdvanced" PopupControlID="phAdvanceButtons" HoverCssClass="popupHover btn btn-default" PopupPosition="Top" OffsetX="0" OffsetY="-10" PopDelay="50" />

                <button class="btn btn-default js-btn-cart-advanced hide-control"><span class="fa fa-gear"></span> pro pokročilé</button>
                <asp:Button ID="btnBasketCalc"     runat="server" CssClass="button btn btn-default" Text="<%$ Resources: Resource, BasketCalcTitle %>" OnClick="btnBasketCalc_Click" ToolTip="<%$ Resources: Resource, BasketCalcToolTip %>" />
                <asp:Button ID="btnBasketDelete"   runat="server" CssClass="button btn btn-default" Text="<%$ Resources: Resource, BasketDeleteTitle %>" OnClick="btnBasketDelete_Click" ToolTip="<%$ Resources: Resource, BasketDeleteToolTip %>" />
                <asp:Button ID="btnBasketContinue" runat="server" CssClass="button btn btn-default" Text="<%$ Resources: Resource, BasketContinueTitle %>" OnClick="btnBasketContinue_Click" ToolTip="<%$ Resources: Resource, BasketContinueToolTip %>" />
                <asp:Button ID="btnBasketOrder"    runat="server" CssClass="button btn btn-basic" Text="<%$ Resources: Resource, BasketOrderTitle %>" OnClick="btnBasketOrder_Click" />
                <asp:Panel ID="phAdvanceButtons" runat="server" CssClass="cart-advanced-buttons">
                    <asp:Button ID="btnBasketSend"     runat="server" CssClass="button btn btn-default" Text="<%$ Resources: Resource, BasketSendTitle %>" />
                    <asp:Button ID="btnBasketExport"   runat="server" CssClass="button btn btn-default" Text="<%$ Resources: Resource, BasketExportTitle %>" OnClick="btnBasketExport_Click" />
                    <asp:Button ID="btnBasketInsert"   runat="server" CssClass="button btn btn-default" Text="<%$ Resources: Resource, BasketInsertTitle %>" OnClick="btnBasketInsert_Click" Visible="false" />
                    <asp:Button ID="btnBasketImport"   runat="server" CssClass="button btn btn-default" Text="<%$ Resources: Resource, BasketImportTitle %>" Visible="false" />
                    <zas:ZasPrintButtonButton ID="btnBasketPrint" runat="server"
                        PrintHtmlTemplate="~/App_Firma/Templates/basket/basket_001.htm" PrintImageHeader="~/App_Firma/Templates/pdf_header_001.jpg" PrintImageFooter="~/App_Firma/Templates/pdf_footer_001.jpg"
                        MarginByHeader="true" MarginByFooter="true"
                        PrintFontFile="~/App_Firma/Templates/arial.ttf"
                        PdfTitle="Nákupní košík" PdfSubject=""
                        CssClass="button btn btn-default" Text="<%$ Resources: Resource, BasketPrintTitle %>" OnClick="btnBasketPrint_Click" />
                </asp:Panel>
			</asp:Panel>
			<!-- /cartButtons -->
						
            <asp:Panel ID="BasketMoreItems" runat="server" CssClass="ProductListPicture cart-product-list">
				 <h2 class="text-center"><span class="orange">Oblíbené</span> zboží</h2>
                <asp:PlaceHolder ID="phOurTips" runat="server" />
            </asp:Panel>

            <asp:Panel ID="SendMail_Panel" runat="server">
                <asp:ModalPopupExtender ID="SendMail_Panel_mpe" runat="server"
                    TargetControlID="btnBasketSend" PopupControlID="SendMailAction"
                    DropShadow="true" BackgroundCssClass="modal" CancelControlID="hlStorno" />
                <asp:Panel ID="SendMailAction" runat="server" CssClass="modal-popup">
                    <!-- pageDesc -->
                    <div class="pageDesc modal-desc">
                        <div class="modal-title"><asp:Literal ID="lh1" runat="server" Text="<%$ Resources: Resource, BasketSendMailTitle %>"></asp:Literal></div>
                        <asp:Panel ID="Panel2" runat="server">
                            <p><asp:Literal ID="Literal3" runat="server" Text="<%$ Resources: Resource, BasketSendMailDesc %>" /></p>
                        </asp:Panel>

						<div class="modal-contact-form contactForm">
                            <fieldset>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="formRow">
                                            <label><asp:Literal ID="l3" runat="server" Text="<%$ Resources: Resource, ContactFormEmail %>" />:</label>
                                            <asp:TextBox ID="sm_email" runat="server" CssClass="form-control" />
                                            <asp:FilteredTextBoxExtender ID="f_sm_email" runat="server"
                                                TargetControlID="sm_email"
                                                FilterType="Numbers,LowercaseLetters,UppercaseLetters,Custom"
                                                ValidChars="@._-" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                ErrorMessage="<%$ Resources: Resource, RequiredField %>" ValidationGroup="sm-send" 
                                                ControlToValidate="sm_email" SetFocusOnError="true" Display="Dynamic" CssClass="reguired-field-mess" />
                                            <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                                ControlToValidate="sm_email"
                                                ValidationExpression="[A-Za-z0-9_-]+(\.[A-Za-z0-9_-]+)*@[A-Za-z0-9_-]+(\.[A-Za-z0-9_-]+)+"
                                                ErrorMessage="<%$ Resources: Resource, E_mailWrongFormat %>" Display="Dynamic" SetFocusOnError="true" ValidationGroup="sm-send" />
                                            <asp:TextBoxWatermarkExtender ID="tbweEmail" runat="server"
                                                TargetControlID="sm_email"
                                                WatermarkText="<%$ Resources: Resource, BasketEmailWaterMarkSm %>" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">                                 
                                        <div class="formRow">
                                            <label><asp:Literal ID="l1" runat="server" Text="<%$ Resources: Resource, ContactFormName %>" />:</label>
                                            <asp:TextBox ID="sm_jmeno" runat="server" CssClass="form-control" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                ErrorMessage="<%$ Resources: Resource, RequiredField %>" ValidationGroup="sm-send"
                                                ControlToValidate="sm_jmeno" SetFocusOnError="true" Display="Dynamic" CssClass="reguired-field-mess" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="formRow">
                                            <label><asp:Literal ID="l5" runat="server" Text="<%$ Resources: Resource, BasketTextOfMessageSm %>" />:</label>
                                            <asp:TextBox ID="sm_zprava" runat="server" Columns="50" Rows="5" CssClass="form-control" TextMode="MultiLine" />
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <!-- /pageDesc -->

			        <!-- cartButtons -->
			        <div class="cartButtons modal-buttons">
                        <asp:Button ID="btSend" runat="server" CssClass="button btn btn-basic btn-sm" 
                            Text="<%$ Resources: Resource, ProductSendMail %>" ValidationGroup="sm-send" 
                            OnClick="btnBasketSend_Click" />
                        <asp:HyperLink  ID="hlStorno"   runat="server" CssClass="button btn btn-default btn-sm" Text="<%$ Resources: Resource, BtnStorno %>" />
			        </div>
			        <!-- /cartButtons -->
                </asp:Panel>
            </asp:Panel>

            <asp:Panel ID="AfterAction_Panel" runat="server">
                <asp:Button ID="FakeBtnAction" runat="server" CssClass="hide-control" />
                <asp:ModalPopupExtender ID="AfterAction_mpe" runat="server"
                    TargetControlID="FakeBtnAction" PopupControlID="AfterAction" CancelControlID="hlAfterBack"
                    DropShadow="true" BackgroundCssClass="modal" />
                <asp:Panel ID="AfterAction" runat="server" CssClass="modal-popup">
                    <!-- pageDesc -->
                    <div class="pageDesc">
                        <h1><asp:Literal ID="Literal4" runat="server" Text="<%$ Resources: Resource, BasketSendMailTitle %>"></asp:Literal></h1>
                        <asp:Panel ID="Panel5" runat="server">
                            <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources: Resource, BasketSuccessText %>" />
                        </asp:Panel>
                    </div>
                    <!-- /pageDesc -->

			        <!-- cartButtons -->
			        <div class="cartButtons">
                        <asp:HyperLink ID="hlAfterBack" CssClass="button w" runat="server" Text="<%$ Resources: Resource, CloseWindow %>" />
			        </div>
			        <!-- /cartButtons -->
                </asp:Panel>
            </asp:Panel>

            <asp:Panel ID="ImportXml_Panel" runat="server">
                <asp:ModalPopupExtender ID="ImportXml_Panel_mpe" runat="server"
                    TargetControlID="btnBasketImport" PopupControlID="ImportXmlAction"
                    DropShadow="true" BackgroundCssClass="modal" CancelControlID="hlStornoImp" />
                <asp:Panel ID="ImportXmlAction" runat="server" CssClass="modal-popup">
                    <!-- pageDesc -->
                    <div class="pageDesc">
                        <h1><asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: Resource, BasketImportXmlTitle %>"></asp:Literal></h1>
                        <asp:Panel ID="Panel3" runat="server">
                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources: Resource, BasketImportXmlDesc %>" />
                        </asp:Panel>

						<div class="contactForm">
                            <fieldset>
                                
								<!-- contactLeft -->
								<div class="contactLeft">
								    <div class="formRow">
                                        <label>
                                            <strong><em><asp:Literal ID="Literal8" runat="server" Text="<%$ Resources: Resource, BasketImportXmlFileName %>" />:</em></strong>
                                        </label>
                                        <asp:FileUpload ID="FileUpload1" runat="server"  />

								    </div>
                                    
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            Pracuji ...<asp:Literal ID="lImpWork" runat="server"></asp:Literal>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
							    </div>
							    <!-- /contactLeft -->
							
							    
                            </fieldset>
                        </div>
                    </div>
                    <!-- /pageDesc -->

			        <!-- cartButtons -->
			        <div class="cartButtons">
                        <asp:Button ID="btImport" runat="server" CssClass="button gray w"
                            Text="<%$ Resources: Resource, BasketImportXmlBtn %>"
                            OnClick="btnBasketImport_Click" />
                        <asp:HyperLink  ID="hlStornoImp"   runat="server" CssClass="button" Text="<%$ Resources: Resource, BtnStorno %>" />
			        </div>
			        <!-- /cartButtons -->
                </asp:Panel>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Rows="20" Columns="100" Enabled="false" ReadOnly="true" Visible="false"></asp:TextBox>
</asp:Content>
