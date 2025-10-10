<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateOrderStep2_Address.ascx.cs" Inherits="ZASshop.NET.App_UserControls.CreateOrderStep2_Address" EnableViewState="true" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel runat="server">
                <asp:Panel ID="pErrorMessage" runat="server" CssClass="pageCustomError" Visible="false" />

				<div class="cartButtons order-buttons">
                    <asp:Button ID="btnContinue1" runat="server" 
                        Text="<%$ Resources: Resource, BtnContinue %>" class="button btn btn-basic" 
                        onclick="btnContinue_Click" />
				</div>

                <input type="hidden" class="order-hidden-address-id" value="" runat="server" id="hAddressId" name="hAddressId" />

				<!-- orderBox -->
				<div class="orderBox boxHeader order-box">
					<h2 class="h1 mod-upper"><asp:Literal ID="lInvoicesAddress" runat="server" Text="<%$ Resources: Resource, InvoicesAddress %>" /></h2>
					<p>
                        <asp:Literal ID="llInvoicesAddressDescription" runat="server" Text="<%$ Resources: Resource, InvoicesAddressDescription %>" />
                        <br />
                        <br />
                        <asp:Literal ID="lInvHelpDesc" runat="server" Text="<%$ Resources: Resource, InvoicesAddressDescriptionAddress %>" /> 
                        <asp:HyperLink ID="hlInvAddressUrl" runat="server" Text="<%$ Resources: Resource, AddressDescriptionAddressUrlTitle %>"/>.
                    </p>
					
				</div>
				<!-- /orderBox -->

				<!-- addresses -->
				<div class="addresses">
                    <div runat="server" id="invNewAddressDiv" class='<%# (InvAddressCount==0 || (IsPostBack && (hAddressId.Value=="F0" || (Request!=null && Request.Form!=null && Request.Form[hAddressId.UniqueID].ToString()=="F0")))) ? "collapsible collapsible-opened" : "collapsible"  %>' data-hidden-field="F0">
                        <p runat="server" id="invNewAddressBtnNew" class="collapsible-header hide-control">
                            <a href="" data-text-closed="<%# Resources.Resource.AddressNew %>" class="button btn btn-basic" data-text-opened="<%# Resources.Resource.Storno %>"><%# Resources.Resource.AddressNew %></a>
                        </p>
                        <div class="collapsible-body">
                            <div>
                                <h2 class="h1"><asp:Literal ID="newInvAddressTitle" runat="server" Text="<%$ Resources: Resource, AddressInvNewTitle %>" /></h2>
                            </div>
                            <asp:Panel ID="address_new_inv_panel" runat="server" CssClass="new-address">
                                <asp:PlaceHolder ID="phNewInvAddress" runat="server" />
    					    </asp:Panel>
                        </div>
                    </div>

                    <div class="row order-addressess">
                    
                        <zas:ZasRepeater ID="rInvoicesAddress" runat="server" OnItemCommand="r_ItemCommand" OnItemDataBound="r_ItemDataBound" CssClass="orderBox thirdPage " CssClassActive="orderBox thirdPage active">
                            <ItemTemplate>
                                <asp:HiddenField ID="InvAddressID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "poradi") %>' />
                                <asp:HiddenField ID="InvAddressState" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "stat") %>' />
                                <!-- orderBox -->
                                <asp:LinkButton ID="InvlbAddress" runat="server" CommandName="select" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "poradi") %>' CssClass="col-sm-6 col-md-4">
                                    <asp:Panel ID="Invaddress_panel" runat="server" CssClass='<%# (ActInvAddressValue==DataBinder.Eval(Container.DataItem, "poradi").ToString() ? "orderBox thirdPage active" : "orderBox thirdPage") %>' >
                                        <asp:RadioButton ID="InvrbSelected" runat="server" Enabled="false" Checked='<%# (ActInvAddressValue==DataBinder.Eval(Container.DataItem, "poradi").ToString() ? true : false) %>' CssClass="address-radio" />
    								    <h2 class="h1 mod-upper"><%# DataBinder.Eval(Container.DataItem, "nazev") %></h2>
    								    <address>
    									    <%# DataBinder.Eval(Container.DataItem, "ulice") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "cislo_popisne") %><br />
    									    <%# DataBinder.Eval(Container.DataItem, "mesto") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "psc") %>,&nbsp;<%# DataBinder.Eval(Container.DataItem, "stat_txt") %><%# !String.IsNullOrEmpty(ZASutility.MyUtility.SafeEvalString(Container.DataItem, "uz_jednotka")) ? ",&nbsp;" + ZASutility.MyUtility.SafeEvalString(Container.DataItem, "uz_jednotka_txt") : "" %><br />
                                            <br />
    									    <asp:Literal ID="l2" runat="server" Text="<%$ Resources: Resource, AddressContact %>" />: <%# DataBinder.Eval(Container.DataItem, "kontaktni_osoba") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "kontaktni_osoba_p") %><br />
                                            <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "telefon").ToString()) ? Resources.Resource.AddressPhone + ": " + DataBinder.Eval(Container.DataItem, "telefon_preset").ToString() : "" %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "telefon") %>
                                            <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "telefon").ToString()) && !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "mobil").ToString())  ? ", " : "" %>
                                            <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "mobil").ToString()) ? DataBinder.Eval(Container.DataItem, "mobil_preset").ToString() : "" %> <%# DataBinder.Eval(Container.DataItem, "mobil") %><br />
                                            <br />        
                                            <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "ico").ToString()) ? Resources.Resource.IC.ToString() + ": " + DataBinder.Eval(Container.DataItem, "ico") : "" %>
                                            <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "dic").ToString()) ? Resources.Resource.DIC.ToString() + ": " + DataBinder.Eval(Container.DataItem, "dic") : "" %>
    								    </address>
                            
                                        <asp:Panel ID="pInvAddressEditControl" runat="server" CssClass="addressButtons" Visible="false">
                                            <input type="submit" name="" class="button small" value="vyber" />
                                            <input type="submit" name="" class="button small" value="uprav" />
                                            <input type="submit" name="" class="button small" value="smaž" />
                                        </asp:Panel>
        					        </asp:Panel>
                                </asp:LinkButton>
    					        <!-- /orderBox -->

                                <asp:Panel runat="server" ID="clearDiv_2_1" CssClass="clearfix hidden-xs visible-sm-block hidden-md hidden-lg" Visible='<%# ((Container.ItemIndex + 1) % 2 == 0) %>' />
                                <asp:Panel runat="server" ID="clearDiv_3_1" CssClass="clearfix hidden-xs hidden-sm visible-md-block visible-lg-block" Visible='<%# ((Container.ItemIndex + 1) % 3 == 0) %>' />

                            </ItemTemplate>
                        </zas:ZasRepeater>
					
                    </div>
				    
				</div>
				<!-- /addresses -->


				<!-- orderBox -->
				<asp:Panel ID="pDeliveryAddressDesc" runat="server" CssClass="orderBox boxHeader order-box">
					<h2 class="h1 mod-upper"><asp:Literal ID="lDeliveryAddress" runat="server" Text="<%$ Resources: Resource, DeliveryAddress %>" /></h2>
                    <asp:CheckBox ID="cbxDeliveryAddress" runat="server" 
                        Text="<%$ Resources: Resource, DeliveryAddressLikeInvoices %>"
                        OnCheckedChanged="cbxDeliveryAddress_CheckedChanged" AutoPostBack="true" CssClass="del-address-inv" />
				    
					<asp:Panel ID="pDelAddressDescBtn" runat="server" CssClass="del-address-desc" style="overflow: hidden;">
                        <p>
                        <asp:Literal ID="lDeliveryAddressDescription" runat="server" Text="<%$ Resources: Resource, DeliveryAddressDescription %>" />
                        <br />
                        <br />
                        <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: Resource, DeliveryAddressDescriptionAddress %>" /> 
                        <asp:HyperLink ID="hlDelAddressUrl" runat="server" Text="<%$ Resources: Resource, AddressDescriptionAddressUrlTitle %>"/>.
                        </p>
                    </asp:Panel>
					
				</asp:Panel>
				<!-- /orderBox -->

				<!-- addresses -->
				<div class="addresses">
                <asp:Panel ID="pDeliveryAddress" runat="server" CssClass="addresses" style="min-height:500px; overflow: hidden;">
                    <div class='<%# (IsPostBack && (hAddressId.Value=="D0" || (Request!=null && Request.Form!=null && Request.Form[hAddressId.UniqueID].ToString()=="D0"))) ? "collapsible collapsible-opened" : "collapsible"  %>' data-hidden-field="D0">
                        <p class="collapsible-header hide-control">
                            <a href="" data-text-closed="<%# Resources.Resource.AddressNew %>" class="button btn btn-basic" data-text-opened="<%# Resources.Resource.Storno %>"><%# Resources.Resource.AddressNew %></a>
                        </p>
                        <div class="collapsible-body">
                            <div>
                                <h2><asp:Literal ID="newDevAddressTitle" runat="server" Text="<%$ Resources: Resource, AddressDelNewTitle %>" /></h2>
                            </div>
                            <asp:Panel ID="address_new_del_panel" runat="server" CssClass="new-address">
                                <asp:PlaceHolder ID="phNewDelAddress" runat="server" />
    					    </asp:Panel>
                        </div>
                    </div>

                    <div class="row order-addressess">

                        <zas:ZasRepeater ID="rDeliveryAddress" runat="server" OnItemCommand="r_ItemCommand" OnItemDataBound="r_ItemDataBound" CssClass="orderBox halfPage" CssClassActive="orderBox halfPage active">
                            <ItemTemplate>
                                <asp:HiddenField ID="AddressID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "poradi") %>' />
                                <asp:HiddenField ID="AddressState" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "stat") %>' />
    					        <!-- orderBox -->
                                <asp:LinkButton ID="lbAddress" runat="server" CommandName="select" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "poradi") %>' CssClass="col-sm-6 col-md-4">
                                    <asp:Panel ID="address_panel" runat="server" CssClass='<%# (ActDelAddressValue==DataBinder.Eval(Container.DataItem, "poradi").ToString() ? "orderBox halfPage active" : "orderBox halfPage") %>'>
    								    <asp:RadioButton ID="rbSelected" runat="server" Enabled="false" Checked='<%# (ActDelAddressValue==DataBinder.Eval(Container.DataItem, "poradi").ToString() ? true : false) %>' CssClass="address-radio" />
    								    <h2 class="h1 mod-upper"><%# DataBinder.Eval(Container.DataItem, "nazev") %></h2>
    								    <address>
    									    <%# DataBinder.Eval(Container.DataItem, "ulice") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "cislo_popisne") %>,&nbsp;<%# DataBinder.Eval(Container.DataItem, "mesto") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "psc") %><br />
    									    <%# DataBinder.Eval(Container.DataItem, "stat_txt") %><%# !String.IsNullOrEmpty(ZASutility.MyUtility.SafeEvalString(Container.DataItem, "uz_jednotka")) ? ",&nbsp;" + ZASutility.MyUtility.SafeEvalString(Container.DataItem, "uz_jednotka_txt") : "" %><br />
                                            <br />
    									    Kontakt: <%# DataBinder.Eval(Container.DataItem, "kontaktni_osoba") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "kontaktni_osoba_p") %><br />
                                            Tel: <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "telefon").ToString()) ? DataBinder.Eval(Container.DataItem, "telefon_preset").ToString() : "" %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "telefon") %>
                                            <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "telefon").ToString()) && !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "mobil").ToString())  ? ", " : "" %>
                                            <%# DataBinder.Eval(Container.DataItem, "mobil_preset") %> <%# DataBinder.Eval(Container.DataItem, "mobil") %><br />
    								    </address>

                                        <asp:Panel ID="pDelAddressEditControl" runat="server" CssClass="addressButtons">
                                            <input type="submit" name="" class="button small" value="vyber" />
                                            <input type="submit" name="" class="button small" value="uprav" />
                                            <input type="submit" name="" class="button small" value="smaž" />
                                        </asp:Panel>

                                    </asp:Panel>
                                </asp:LinkButton>
    					        <!-- /orderBox -->

                                <asp:Panel runat="server" ID="clearDiv_2_2" CssClass="clearfix hidden-xs visible-sm-block hidden-md hidden-lg" Visible='<%# ((Container.ItemIndex + 1) % 2 == 0) %>' />
                                <asp:Panel runat="server" ID="clearDiv_3_2" CssClass="clearfix hidden-xs hidden-sm visible-md-block visible-lg-block" Visible='<%# ((Container.ItemIndex + 1) % 3 == 0) %>' />

                            </ItemTemplate>
                        </zas:ZasRepeater>

                    </div>

                </asp:Panel>
                
                <asp:CollapsiblePanelExtender ID="cpeDeliveryAddress" runat="Server" Enabled="false"
                    TargetControlID="pDeliveryAddress"
                    ExpandControlID="cbxDeliveryAddress" 
                    CollapseControlID="cbxDeliveryAddress" 
                    Collapsed="True"
                    ScrollContents="true"
                    SuppressPostBack="false" />
				</div>
				<!-- /addresses -->
				
								
				<div class="cartButtons order-buttons">
                    <asp:HyperLink ID="hpBack" runat="server" CssClass="btn btn-default" NavigateUrl="<%$ Resources: Resource, PageDefaultForUrl %>" Text="<%$ Resources: Resource, BasketAfterActionBack %>" />
					<asp:Button ID="btnContinue2" runat="server" CssClass="btn btn-basic"
                        Text="<%$ Resources: Resource, BtnContinue %>" class="button" 
                        onclick="btnContinue_Click" />
				</div>

                <script>
                    $(document).ready(function() {
                        $(".collapsible-header a, .collapsible .address-edit-storno").live('click',function(e) {
                            $(".address-edit").removeClass("address-active");
                            e.preventDefault();
                            var parent = $(this).parents(".collapsible");
                            var link = parent.find(".collapsible-header a");
                            parent.toggleClass("collapsible-opened");
                            if(parent.hasClass("collapsible-opened")) {
                                link.text(link.attr("data-text-opened"));
                                changeHiddenId(parent.attr("data-hidden-field"));
                            } else {
                                link.text(link.attr("data-text-closed"));
                                clearHiddenId();
                            }
                        });
                    });


                    function changeHiddenId( inputvalue ) {
                        $(".order-hidden-address-id").val(inputvalue);
                        console.debug($(".order-hidden-address-id").val());
                    }
                    function clearHiddenId() {
                        changeHiddenId("");
                    }

                </script>
</asp:Panel>