<%@ Page Language="C#" MasterPageFile="~/ZASshop.Master" AutoEventWireup="true" CodeBehind="AddressesList.aspx.cs" Inherits="ZASshop.NET.AddressListNew" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ZasShopBodyPlaceHolder" runat="server">
    <script>
        $(document).ready(function () {
            setTimeout(function() {
                $(".form-change-country").each(function(i, item) {
                    $( this ).trigger("change");
                });
            }, 1000);
        });
        /** Ve formulari 'smartform-instace-2' nastavi naseptavanou zemi podle hodnoty v combu #country. */
        function changeCountry(state, typ, poradi) {
            var country = state.value;
            if (country != 'CZ' && country != 'SK') 
                smartform.getInstance('smartform-instance-' + typ + '-' + poradi).setCountry(country);
            else
                smartform.getInstance('smartform-instance-' + typ + '-' + poradi).setCountry(country);
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div class="dynamicPopulate_Updating">
                        
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>

			<div class="order RegForm1">
				<!-- orderBox -->
				<div class="boxHeader pageDesc page-description">
					<h1><%: (AddressType != ZAScontrols.ZasAddressType.Invoice) ? ZASutility.MyUtility.GetLangResource("PageDelAddressTitle") : ZASutility.MyUtility.GetLangResource("PageInvAddressTitle") %></h1>
                    <div class="page-description-text">
					<p>
                        <asp:Literal ID="lAddressDescription1" runat="server" Text="<%$ Resources: Resource, AddressDesc1 %>" />
                    </p>
                    <p>
                        <asp:Literal ID="lAddressDescription2" runat="server" Text="<%$ Resources: Resource, AddressDesc2 %>" />
                    </p>
                    </div>
					
				</div>
				<!-- /orderBox -->

    		    <!-- addresses -->
                <div class="user-addresses addresses">
			        <div class="addresses">
                        <zas:ZasRepeater ID="rAddress" runat="server" OnItemDataBound="r_ItemDataBound" CssClass="orderBox halfPage active" CssClassActive="orderBox halfPage active">
                            <ItemTemplate>
                                    <div class='address-edit<%# (IsPostBack && DataBinder.Eval(Container.DataItem, "poradi").ToString()==hAddressId.Value) ? " address-active" : ""  %>'>
                                        <!-- adresa -->
                                        <asp:Panel ID="address_panel" runat="server" CssClass="orderBox halfPage active">
                                            <asp:HiddenField ID="AddressID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "poradi") %>' />
                                            <h2 class="h1"><%# DataBinder.Eval(Container.DataItem, "nazev") %></h2>
        							        <address>
        								        <%# DataBinder.Eval(Container.DataItem, "ulice") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "cislo_popisne") %><br />
        								        <%# DataBinder.Eval(Container.DataItem, "mesto") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "psc") %>,&nbsp;<%# DataBinder.Eval(Container.DataItem, "stat_txt") %><%# !String.IsNullOrEmpty(ZASutility.MyUtility.SafeEvalString(Container.DataItem, "uz_jednotka")) ? ",&nbsp;" + ZASutility.MyUtility.SafeEvalString(Container.DataItem, "uz_jednotka_txt") : "" %><br />
                                                <br />
        								        <asp:Literal ID="l2" runat="server" Text="<%$ Resources: Resource, AddressContact %>" />: <%# DataBinder.Eval(Container.DataItem, "kontaktni_osoba") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "kontaktni_osoba_p") %><br />
                                                <asp:Panel runat="server" Visible='<%# (AddressType == ZAScontrols.ZasAddressType.Invoice) ? false : true %>'>
                                                    <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "telefon").ToString()) || !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "mobil").ToString()) ? Resources.Resource.AddressPhone + ": " : "" %>
                                                    <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "telefon").ToString()) ? DataBinder.Eval(Container.DataItem, "telefon_preset").ToString() : "" %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "telefon") %>
                                                    <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "telefon").ToString()) && !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "mobil").ToString())  ? ", " : "" %>
                                                    <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "mobil").ToString()) ? DataBinder.Eval(Container.DataItem, "mobil_preset").ToString() : "" %> <%# DataBinder.Eval(Container.DataItem, "mobil") %><br />
                                                </asp:Panel>
                                                <br />
                                                <asp:Panel ID="pIcDic" runat="server" Visible='<%# (AddressType != ZAScontrols.ZasAddressType.Invoice) ? false : true %>'>
                                                    <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "ico").ToString()) ? Resources.Resource.IC.ToString() + ": " + DataBinder.Eval(Container.DataItem, "ico") : "" %>
                                                    <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "dic").ToString()) ? Resources.Resource.DIC.ToString() + ": " + DataBinder.Eval(Container.DataItem, "dic") : "" %>
                                                </asp:Panel>
        							        </address>
                                            <asp:Panel ID="pAddressEditControl" runat="server" CssClass="addressButtons" Visible="false">
                                                <asp:LinkButton ID="lbAddressDelete"    runat="server" CssClass="button small btn btn-danger btn-sm" Text="<%$ Resources: Resource, AddressActionDeleteBtn %>"  Visible='<%# (DataBinder.Eval(Container.DataItem, "poradi").ToString() == "1") ? false : true %>' CommandName="delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "poradi") %>' OnClientClick=<%# "return confirm('" + Resources.Resource.AddressDeleteConfirmQuestion + "');" %> />
                                                <asp:HyperLink ID="hplAddressEdit"      runat="server" CssClass="button small btn btn-basic btn-sm address-edit-button" Text="<%$ Resources: Resource, AddressActionEditBtn %>" data-address-poradi='<%# DataBinder.Eval(Container.DataItem, "poradi") %>'/>
                                            </asp:Panel>
            					        </asp:Panel>

                                        <div class="address-edit-panel">
                                            <asp:Panel ID="address_edit_panel" runat="server">
                                                <asp:PlaceHolder ID="phEditAddress" runat="server" />
                					        </asp:Panel>
                                        </div>
        					            <!-- /orderBox -->
                                    </div>
                            </ItemTemplate>
                        </zas:ZasRepeater>
										
			        </div>

                    <input runat="server" type="hidden" value="" id="hAddressId" name="hAddressId" class="hidden-address-id" />

                </div>
			    <!-- /addresses -->

                <script>

                    function changeHiddenId(inputvalue) {
                        $(".hidden-address-id").val(inputvalue);
                        console.debug($(".hidden-address-id").val());
                    }
                    function clearHiddenId() {
                        changeHiddenId("");
                    }

                    $(document).ready(function () {
                        $(".address-edit-button").live('click', function (e) {
                            e.preventDefault();
                            $(".address-edit").removeClass("address-active");
                            $(this).parents(".address-edit").addClass("address-active");
                            changeHiddenId($(this).attr("data-address-poradi"));
                        });
                        $(".address-edit-storno").live('click', function (e) {
                            e.preventDefault();
                            clearHiddenId();
                            $(".address-edit").removeClass("address-active");
                        });
                    });


                    $(document).ready(function () {
                        $(".collapsible-header a, .collapsible .address-edit-storno").live('click', function (e) {
                            $(".address-edit").removeClass("address-active");
                            e.preventDefault();
                            var parent = $(this).parents(".collapsible");
                            var link = parent.find(".collapsible-header a");
                            parent.toggleClass("collapsible-opened");
                            if (parent.hasClass("collapsible-opened")) {
                                changeHiddenId(0)
                                link.text(link.attr("data-text-opened"));
                            } else {
                                clearHiddenId();
                                link.text(link.attr("data-text-closed"));
                            }
                        });
                    });
                </script>

                <div class="collapsible">
                    <p class="collapsible-header hide-control" runat="server" visible="false">
                        <a href="" data-text-closed="<%# Resources.Resource.AddressNew %>" class="button btn btn-basic" data-text-opened="<%# Resources.Resource.Storno %>"><%# Resources.Resource.AddressNew %></a>
                    </p>
                    <div class="collapsible-body">
                        <div>
                            <h2 class="h1"><%: (AddressType == ZAScontrols.ZasAddressType.Invoice) ? Resources.Resource.AddressInvNewTitle : Resources.Resource.AddressDelNewTitle %></h2>
                        </div>
                        <asp:Panel ID="address_new_panel" runat="server" CssClass="new-address">
                            <asp:PlaceHolder ID="phNewAddress" runat="server" />
    					</asp:Panel>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>                
</asp:Content>
