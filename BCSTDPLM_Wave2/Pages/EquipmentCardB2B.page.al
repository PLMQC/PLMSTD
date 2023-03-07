page 33000892 "Equipment Card B2B"
{

    Caption = 'Equipment Card';
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    PageType = Card;
    Permissions = TableData "Equipment B2B" = rimd;
    SourceTable = "Equipment B2B";
    UsageCategory = Documents;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                    AssistEdit = true;
                    ApplicationArea = All;
                    ToolTip = 'Equipment Master Number series is Created in Number Series page. These Numbers are Unique for every new Equipment.';
                    trigger OnAssistEdit();
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.UPDATE();
                    end;
                }
                field(Name; Rec.Name)
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                    ToolTip = 'Need to specify the Equipment name in this field.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Search name would be the unique name for Every Equipment. need to Mention search Name in this field';
                }
                field("Model No."; Rec."Model No.")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specify the Model Number for the Equipment. Can Get From Equipment Name plate.';
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                    ApplicationArea = All;
                    ToolTip = 'Manufacturer need to be specified in the field. Can get from Equipment name Plate Details.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Serial Number need to be specified. Can get fromEquipment name plate Details.';
                }
                field("Is In Use"; Rec."Is In Use")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines whether the Equipment is in use or not.';
                    Editable = "Is In UseEditable";

                    trigger OnValidate();
                    begin
                        if Rec."Is In Use" <> true then
                            Rec."Equipment Status" := Rec."Equipment Status"::" ";
                    end;
                }
                field(URL; Rec.URL)
                {
                    ApplicationArea = All;
                    ToolTip = 'This field used to attach the URL Of the Equipment.';
                }
                field("Specification Template"; Rec."Template No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Created Specification Template need to Assign.';
                    Caption = 'Specification Template';
                }
                field("Specification Template Name"; Rec."Template Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Based on attached Specification Template, Specification template name will be appear.';
                    Caption = 'Specification Template Name';
                }
                field("Machine Location"; Rec."Machine Location")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Specifies the Equipment Location.';
                    Caption = 'Equipment Location';
                }
                field("Location Name"; Rec."Location Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Based on attached Location, Location name will Appear.';
                }
                field("Equipment Group"; Rec."Equipment Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Created Equipment group need to assign here.';
                    Caption = 'Equipment Group';
                    Importance = Promoted;
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Equipment Name"; Rec."Equipment Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Based on Attached Equipment Group, System name will appear.';
                    Caption = 'System Name';
                }
                field("Check List Code"; Rec."Check List Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Created Check list need to Assign Here.';
                }
                field("Equipment Status"; Rec."Equipment Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'It defines under which Status, currently Being this Equipment.';
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field(Resource; Rec.Resource)
                {
                    ApplicationArea = All;
                    ToolTip = 'Need to Assign the Resource.';
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = All;
                    ToolTip = 'Image of the Equipment can be assign here.';
                }
            }
            group(Details)
            {
                Caption = 'Details';
                field(Control1102152039; '')
                {
                    ApplicationArea = All;
                    ToolTip = 'This Fasttab shows the Details of the Equipment. Ex:- AMC, Warranty, etc.,';
                    CaptionClass = Text00017Lbl;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Fixed Asset Code"; Rec."Fixed Asset Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Need to Assign the Fixed Asset Code.';
                }
                field("Fixed Asset Name"; Rec."Fixed Asset Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Based on Selected FA, Name Will be appear.';
                }
                field(Control1102152026; '')
                {
                    ApplicationArea = All;
                    ToolTip = 'It defines the Prodcution Reference Details.';
                    CaptionClass = Text00018Lbl;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Equipment Type"; Rec."Machine Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'It defines whether the equipment is comes under the production or Non-Production.';
                    Caption = 'Equipment Type';
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        CheckStatus();
                    end;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'It defines the Area type(Work center/Machine Center). If The Equipment type is Production.';
                    Editable = TypeEditable;
                }
                field("M/W No."; Rec."M/W No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines the Machine or Work center Number.';
                    Editable = "M/W No.Editable";
                }
                field("M/W Description"; Rec."M/W Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Based on M/W No. Type, Description Will appear.';
                }
                field(Control1102152017; '')
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines dates & capacities of the Equipment.';
                    CaptionClass = Text00019Lbl;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Year of Purchase"; Rec."Year of Purchase")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines, in which date Machine was Purchase.';
                    Caption = 'Date  Purchased';

                    trigger OnValidate();
                    begin
                        if Rec."Date of Installed" <> 0D then
                            if Rec."Date of Installed" < Rec."Year of Purchase" then
                                ERROR(Text00023Lbl);
                    end;
                }
                field("Date of Installed"; Rec."Date of Installed")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines, In Which Date Machine was Install.';
                    Caption = 'Date  Installed';
                }
                field(Capacity; Rec.Capacity)
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defined the Machine Capacity.';
                }
                field("Capacity Unit of Measure"; Rec."Capacity Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Specifies the Capacity Unit Of measure.';
                    Editable = CapacityUnitofMeasureEditable;
                }
                field(Control1102152027; '')
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines the Dimensions of the Equipment.';
                    CaptionClass = Text00020Lbl;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Specifies the Department code.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Specifies the Project code.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'It defines the Dimension Set ID.';
                    Importance = Promoted;
                }
                field(Control1102152008; '')
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines the A.M.C. Detials';
                    CaptionClass = Text00014Lbl;
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("A.M.C"; Rec."A.M.C")
                {
                    ApplicationArea = All;
                    ToolTip = 'It populates whether the Equipment comes under AMC or Not.';
                    Caption = 'A.M.C';

                    trigger OnValidate();
                    begin
                        if Rec."A.M.C" = Rec."A.M.C"::No then begin
                            AMCStatusEditable := false;
                            CLEAR(Rec."A.M.Status");
                            AMCStartDateEditable := false;
                            CLEAR(Rec."A.M.C Start Date");
                            AMCEndDateEditable := false;
                            CLEAR(Rec."A.M.C End  Date");
                            AMCVendorNoEditable := false;
                            CLEAR(Rec."A.M.C Vendor No.");
                            AMCVendorNameEditable := false;
                            CLEAR(Rec."A.M.C Vendor Name");
                            AMCVendorAddressEditable := false;
                            CLEAR(Rec."Address of A.M.C Vendor");

                        end else begin
                            AMCStatusEditable := true;
                            AMCStartDateEditable := true;
                            AMCEndDateEditable := true;
                            AMCVendorNoEditable := true;
                            AMCVendorNameEditable := true;
                            AMCVendorAddressEditable := true;
                        end;
                    end;
                }
                field("A.M.Status"; Rec."A.M.Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'It  shows the status of the AMC.';
                    Editable = AMCStatusEditable;
                }
                field("A.M.C Start Date"; Rec."A.M.C Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'It displays the Strating date of AMC.';
                    Editable = AMCStartDateEditable;
                }
                field("A.M.C End  Date"; Rec."A.M.C End  Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Displays the Ending date of AMC.';
                    Editable = AMCStartDateEditable;
                }
                field(Control1102152038; '')
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines the Warranty detials.';
                    CaptionClass = Text00015Lbl;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(Warranty; Rec.Warranty)
                {
                    ApplicationArea = All;
                    ToolTip = 'It specifies, whether the Equipment comes under Warranty period Or Not.';
                    OptionCaption = '" ,Yes,No"';

                    trigger OnValidate();
                    begin
                        if Rec.Warranty = Rec.Warranty::No then begin
                            WarrantyReferanceEditable := false;
                            CLEAR(Rec."Warranty Referance");
                            WarrantyExpiryEditable := false;
                            CLEAR(Rec."Warranty Expiry");
                            WarrantyVendorNoEditable := false;
                            CLEAR(Rec."Warranty Vendor No.");
                            WarrantyVendorNameEditable := false;
                            CLEAR(Rec."Warranty Vendor Name");
                            WarrantyVendorAdressEditable := false;
                            CLEAR(Rec."Address of Warranty Vendor");

                        end else begin
                            WarrantyReferanceEditable := true;
                            WarrantyExpiryEditable := true;
                            WarrantyVendorNoEditable := true;
                            WarrantyVendorNameEditable := true;
                            WarrantyVendorAdressEditable := true;
                        end;
                    end;
                }
                field("Warranty Referance"; Rec."Warranty Referance")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Shows the Warranty reference.';
                    Editable = WarrantyReferanceEditable;
                }
                field("Warranty Expiry"; Rec."Warranty Expiry")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Defines the Warranty Expiry Date.';
                    Editable = WarrantyExpiryEditable;

                    trigger OnValidate();
                    begin
                        if Rec."Year of Purchase" = 0D then
                            ERROR(Text00024Lbl);

                        if Rec."Warranty Expiry" < Rec."Year of Purchase" then
                            ERROR(Text00025Lbl);
                    end;
                }
            }
            group(Vendor)
            {
                Caption = 'Vendor';
                field(Control1102152033; '')
                {
                    ApplicationArea = All;
                    ToolTip = 'This Fasttab Defines, Vendor related data.';
                    CaptionClass = Text00010Lbl;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Need to specify the Purchase vendor.';
                    Importance = Promoted;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Based on selected vendor, vendor name will appear.';
                    Importance = Promoted;
                }
                field("Vendor Address"; Rec."Vendor Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'From selected Vendor master, Address popultes.';
                }
                field("Vendor Address2"; Rec."Vendor Address2")
                {
                    ApplicationArea = All;
                    ToolTip = 'From selected Vendor master, Address2 popultes.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'From selected Vendor master, City popultes.';
                }
                field("State Code"; Rec."State Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'From selected Vendor master, State code popultes.';
                }
                field("Country Code"; Rec."Country Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'From selected Vendor master, Country code popultes.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'From selected Vendor master, Phone No popultes.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = All;
                    ToolTip = 'From selected Vendor master, Contacts popultes.';
                }
                field(Control1102152034; '')
                {
                    ApplicationArea = All;
                    tooltip = 'Gives the detials of the Service vendor.';
                    CaptionClass = Text00011Lbl;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Service Vendor"; Rec."Service Vendor")
                {
                    ApplicationArea = All;
                    tooltip = 'Select the required Service vendor.';
                    Caption = 'Service Vendor';
                }
                field("Service Vendor Name"; Rec."Service Vendor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'From selected Service Vendor master, Vendor Name popultes.';
                }
                field("Service Contact Person"; Rec."Service Contact Person")
                {
                    ApplicationArea = All;
                    ToolTip = 'From selected Service Vendor master, Contact person popultes.';
                }
                field("Service Phone Number"; Rec."Service Phone Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'From selected Service Vendor master, Service phone Number popultes.';
                }
                field(Control1102152001; '')
                {
                    ApplicationArea = All;
                    Tooltip = 'It gives the Detials Of AMC vendor.';
                    CaptionClass = Text00012Lbl;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("A.M.C Vendor No."; Rec."A.M.C Vendor No.")
                {
                    ApplicationArea = All;
                    Tooltip = 'It Defines the AMC Vendor.';
                    Editable = AMCVendorNoEditable;
                }
                field("A.M.C Vendor Name"; Rec."A.M.C Vendor Name")
                {
                    ApplicationArea = All;
                    Tooltip = 'Based on selected Vedor, AMC Vendor name populates.';
                    Editable = AMCVendorNameEditable;
                }
                field("Address of A.M.C Vendor"; Rec."Address of A.M.C Vendor")
                {
                    ApplicationArea = All;
                    Tooltip = 'Based on selected Vendor, AMC vendor address popultes.';
                    Editable = AMCVendorAddressEditable;
                }
                field(Control1102152007; '')
                {
                    ApplicationArea = All;
                    Tooltip = 'It gives the Detials Of Warranty vendor.';
                    CaptionClass = Text00013Lbl;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Warranty Vendor No."; Rec."Warranty Vendor No.")
                {
                    ApplicationArea = All;
                    Tooltip = 'It Defines the Warranty vendor.';
                    Editable = WarrantyVendorNoEditable;
                }
                field("Warranty Vendor Name"; Rec."Warranty Vendor Name")
                {
                    ApplicationArea = All;
                    Tooltip = 'Based on selected vendor, Warranty vendor name popultes.';
                    Editable = WarrantyVendorNameEditable;
                }
                field("Address of Warranty Vendor"; Rec."Address of Warranty Vendor")
                {
                    ApplicationArea = All;
                    Tooltip = 'Based on selected vendor, Warranty vendor address will update.';
                    Editable = WarrantyVendorAdressEditable;
                }
            }
            group("Manufacturer ")
            {
                Caption = 'Manufacturer';
                field("ManufacturerNew"; Rec.Manufacturer)
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                    Tooltip = 'It Provides the details of Manufacturer Details.';
                }
                field("Manufacturer Address"; Rec."Manufacturer Address")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                    ToolTip = 'It Specifies the Manufacturer Address.';
                }
                field("Manufacturer Address2"; Rec."Manufacturer Address2")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Specifies the Manufacturer Address2.';
                }
                field("Post Code/City"; Rec."Post Code/City")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Specifies the Post Code/City.';
                }
                field("Mfc Phone No."; Rec."Mfc Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Specifies the Manufacturer Phone No.';
                }
                field("Mfc Contact"; Rec."Mfc Contact")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Specifies the Manufacturer Contact.';
                }
            }
            group(History)
            {
                Caption = 'History';
                field("Total Capacity"; Rec."Total Capacity")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'It Shows the Capicity of the Equipment.';
                }
                field("Total Run Time - Prod"; Rec."Total Run Time - Prod")
                {
                    Visible = "Total Run Time - ProdVisible";
                    ApplicationArea = All;
                    ToolTip = 'It Shows the Run Time of the Equipment.';
                }
                field("Total Run Time Non Prod."; Rec."Total Run Time Non Prod.")
                {
                    Editable = false;
                    Visible = TotalRunTimeNonProdVisible;
                    ApplicationArea = All;
                    ToolTip = 'It Shows the Run Time (Non- Prod) of the Equipment.';
                }
                field("Total Break Down Hours"; Rec."Total Break Down Hours")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Shows the Break down of the Equipment.';
                }
                field("Total PMR Hours"; Rec."Total PMR Hours")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Shows the PMR hours of the Equipment.';
                }
                field("Total Maintenance Cost"; Rec."Total Break Down Cost")
                {
                    Caption = 'Total Maintenance Cost';
                    ApplicationArea = All;
                    ToolTip = 'It Shows the Maintenance of the Equipment.';
                }
                field("Meter Reading"; Rec."Meter Reading")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Shows the Meter Reading of the Equipment.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(SpecMenu)
            {
                Caption = '&Machine';
                action(Attachment)
                {
                    Caption = 'Attachment';
                    ApplicationArea = all;
                    Tooltip = 'This field used to assign the Related information document.';
                    Image = Attach;
                    Visible = false;

                    trigger OnAction();
                    begin
                        Rec.Attachments();
                    end;
                }
                separator(Separator1102154133)
                {
                }
                action(Specifications)
                {
                    Caption = 'Specifications';
                    ApplicationArea = all;
                    ToolTip = 'Need to assign the Specifications.';
                    Image = SpecialOrder;
                    RunObject = Page "Equipment Specifications B2B";
                    RunPageLink = "Machine ID" = FIELD("No.");
                }
                action(Spares)
                {
                    Caption = 'Spares';
                    ApplicationArea = all;
                    ToolTip = 'Need to assign the Spares.';
                    Image = ItemGroup;
                    RunObject = Page "Equipment Spares B2B";
                    RunPageLink = "Machine ID" = FIELD("No.");
                }
                action(Movements)
                {
                    Caption = 'Movements';
                    ApplicationArea = all;
                    ToolTip = 'Need to assign the Movements.';
                    Image = CreateMovement;
                    RunObject = Page "Equipment Movements B2B";
                    RunPageLink = "Machine ID" = FIELD("No.");
                }
                group("Job Cards")
                {
                    Caption = 'Job Cards';
                    Image = Job;
                    action(Posted)
                    {
                        Caption = 'Posted';
                        ApplicationArea = all;
                        ToolTip = 'It Shows the Posted Job Cards.';
                        Image = CopyToTask;
                        RunObject = Page "Equipment Breakdown B2B";
                        RunPageLink = "Machine ID" = FIELD("No."),
                                       Type = CONST(BreakDown),
                                      Posted = CONST(true);
                    }
                    action("Non Posted")
                    {
                        Caption = 'Non Posted-PM';
                        ApplicationArea = all;
                        ToolTip = 'It Shows the Non Posted Preventive Maintenance Job Cards.';
                        Image = Job;
                        RunObject = page "PM Job List B2B";
                        RunPageLink = "Machine ID" = FIELD("No."),
                                       Type = CONST(PMR),
                                      Posted = CONST(false);
                    }
                    action("Non Posted2")
                    {
                        Caption = 'Non Posted-BM';
                        ApplicationArea = all;
                        ToolTip = 'It Shows the Non Posted Break Down Job Cards.';
                        Image = Job;
                        RunObject = page "Breakdown Job List B2B";
                        RunPageLink = "Machine ID" = FIELD("No."),
                                       Type = CONST(BreakDown),
                                      Posted = CONST(false);
                    }
                }
                action("Pending Complaints")
                {
                    Caption = 'Pending Complaints';
                    ApplicationArea = all;
                    ToolTip = 'It Shows the Pending complaints.';
                    Image = Confirm;
                    RunObject = Page "Equipment Breakdown B2B";
                    RunPageLink = "Machine ID" = FIELD("No."),
                                  Type = CONST(BreakDown),
                                  Posted = CONST(false);
                }
                action("Page Default Dimensions")
                {
                    Caption = 'Dimensions';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Dimensions.';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(33000891),
                                  "No." = FIELD("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                separator(Separator1102154138)
                {
                }
                group("E&ntries")
                {
                    Caption = 'E&ntries';
                    Image = Entries;
                    action("Resource Ledger Entries")
                    {
                        Caption = 'Resource Ledger Entries';
                        ApplicationArea = all;
                        ToolTip = 'It Shows Entries related to Resources.';
                        Image = ResourceLedger;
                        RunObject = Page "Resource Ledger Entries";
                        RunPageLink = "Machine Id B2B" = FIELD("No.");
                    }
                    action("Item Ledger Entries")
                    {
                        Caption = 'Item Ledger Entries';
                        ApplicationArea = all;
                        ToolTip = 'It Shows Entries related to the Equipment.';
                        Image = ItemLedger;
                        RunObject = Page "Item Ledger Entries";
                        RunPageLink = "Machine Id B2B" = FIELD("No.");
                    }
                    action("G/L Entries")
                    {
                        Caption = 'G/L Entries';
                        ApplicationArea = all;
                        ToolTip = 'It Shows the G/L Entries.';
                        Image = GLRegisters;
                        RunObject = Page 20;
                        RunPageLink = "Machine Id B2B" = FIELD("No.");
                    }
                }
                separator(Separator1102154100)
                {
                }
                action("&Check Lists")
                {
                    Caption = '&Check Lists';
                    ApplicationArea = all;
                    ToolTip = 'It Shows Assigned Check List.';
                    Image = CheckList;

                    trigger OnAction();
                    begin
                        Rec.OpenCheckList();
                    end;
                }
                separator(Separator1102154151)
                {
                }
                group(PMR)
                {
                    Caption = 'PMR';
                    Image = Job;
                    action(Action1102154153)
                    {
                        Caption = 'Non Posted';
                        ApplicationArea = all;
                        ToolTip = 'It Shows Non Posted PMR Job Cards.';
                        Image = CopyToTask;
                        RunObject = Page "PM Job List B2B";
                        RunPageLink = "Machine ID" = FIELD("No."),
                                      Type = CONST(PMR),
                                      Posted = CONST(false);
                    }
                    action(Action1102154150)
                    {
                        Caption = 'Posted';
                        ApplicationArea = all;
                        ToolTip = 'It Shows the Posted PMR Job Cards.';
                        Image = CopyToTask;
                        RunObject = Page "Posted Job Cards B2B";
                        RunPageLink = Posted = CONST(true),
                                      Type = CONST(PMR),
                                      "Machine ID" = FIELD("No.");
                    }
                }
            }
            /*group("&Picture")
            {
                Caption = '&Picture';
                Image = Picture;
                Visible = true;
                action("De&lete")
                {
                    Caption = 'De&lete';
                    ApplicationArea = all;
                    Image = Delete;

                    trigger OnAction();
                    begin
                        /*if Rec.Picture.HASVALUE() then
                            if CONFIRM(Text002Lbl, false, TABLECAPTION(), "No.") then begin
                                CLEAR(Picture);
                                CurrPage.SAVERECORD();
                            end;
                    end;
                }
            }*/
            group(FunctionMenu1)
            {
                Caption = 'F&unctions';
                action("Define  Maintenance")
                {
                    Caption = 'Define  Maintenance';
                    ApplicationArea = all;
                    ToolTip = 'From Here need to specify the Manitenance schedule Template.';
                    Image = Calendar;

                    trigger OnAction();
                    begin
                        if PAGE.RUNMODAL(0, MaintSchTemplate) = ACTION::LookupOK then begin
                            MaintenanceschedulePartGRec.RESET();
                            MaintenanceschedulePartGRec.SETRANGE("Machine ID", Rec."No.");
                            if MaintenanceschedulePartGRec.FINDFIRST() then begin
                                if CONFIRM(Text003Lbl) then
                                    AttachPartsToMachine(MaintSchTemplate.Code, Rec."No.", Rec.Name);
                            end else
                                AttachPartsToMachine(MaintSchTemplate.Code, Rec."No.", Rec.Name);
                        end;
                    end;
                }
                action("Get Maintenance")
                {
                    Caption = 'Get Maintenance';
                    ApplicationArea = all;
                    ToolTip = 'From Here Need to get the maintenance and Need to Specify the Date Intervals.';
                    Image = GetLines;

                    trigger OnAction();
                    begin
                        Rec.TESTFIELD("Is In Use");
                        Rec.TESTFIELD("Equipment Status");
                        "Maint.schePart".RESET();
                        "Maint.schePart".SETRANGE("Machine ID", Rec."No.");
                        PAGE.RUNMODAL(33000899, "Maint.schePart");
                    end;
                }
                action("Update Machine Status")
                {
                    Caption = 'Update Machine Status';
                    ApplicationArea = all;
                    ToolTip = 'It will update the status of the machine.';
                    Image = UpdateUnitCost;

                    trigger OnAction();
                    begin
                        EquipmentStatus();
                    end;
                }
                action(Attachments)
                {
                    Caption = 'Attachments';
                    ApplicationArea = all;
                    ToolTip = 'It is Used to attach the related informations.';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        CLEAR(AttachmentsDocumentPageGVar);
                        AttachmentGRec.RESET();
                        AttachmentGRec.FILTERGROUP(2);
                        AttachmentGRec.SETRANGE("Filter Key 1", FORMAT(Rec."No."));
                        AttachmentGRec.SETRANGE("Table Id", DATABASE::"Equipment B2B");
                        AttachmentGRec.SETRANGE("Document No.", Rec."No.");
                        AttachmentGRec.FILTERGROUP(0);
                        AttachmentsDocumentPageGVar.SETTABLEVIEW(AttachmentGRec);
                        AttachmentsDocumentPageGVar.CAPTION(CurrPage.CAPTION());
                        AttachmentsDocumentPageGVar.SetValues(FORMAT(Rec."No."), '', FORMAT(Rec."No."), DATABASE::"Equipment B2B");
                        AttachmentsDocumentPageGVar.RUNMODAL();
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        StatutoryInspectionDueDateEdit := Rec."Statutory Inspection";

        Rec.CALCFIELDS("Total Run Time Non Prod.");
        Rec.CALCFIELDS("Total Run Time - Prod");
        TotProdTime := Rec."Total Run Time Non Prod." + Rec."Total Run Time - Prod";
        UpdateRunTimeFlow();
        if ((Rec."Equipment Status" <> Rec."Equipment Status"::Running) and
              (Rec."Equipment Status" <> Rec."Equipment Status"::" ")) then
            "Is In UseEditable" := false
        else
            "Is In UseEditable" := true;


        MachineTypeOnFormat();


        if Rec."A.M.C" = Rec."A.M.C"::No then begin
            AMCStatusEditable := false;
            CLEAR(Rec."A.M.Status");
            AMCStartDateEditable := false;
            CLEAR(Rec."A.M.C Start Date");
            AMCEndDateEditable := false;
            CLEAR(Rec."A.M.C End  Date");
            AMCVendorNoEditable := false;
            CLEAR(Rec."A.M.C Vendor No.");
            AMCVendorNameEditable := false;
            CLEAR(Rec."A.M.C Vendor Name");
            AMCVendorAddressEditable := false;
            CLEAR(Rec."Address of A.M.C Vendor");
        end else begin
            AMCStatusEditable := true;
            AMCStartDateEditable := true;
            AMCEndDateEditable := true;
            AMCVendorNoEditable := true;
            AMCVendorNameEditable := true;
            AMCVendorAddressEditable := true;
        end;

        if Rec.Warranty = Rec.Warranty::No then begin
            WarrantyReferanceEditable := false;
            CLEAR(Rec."Warranty Referance");
            WarrantyExpiryEditable := false;
            CLEAR(Rec."Warranty Expiry");
            WarrantyVendorNoEditable := false;
            CLEAR(Rec."Warranty Vendor No.");
            WarrantyVendorNameEditable := false;
            CLEAR(Rec."Warranty Vendor Name");
            WarrantyVendorAdressEditable := false;
            CLEAR(Rec."Address of Warranty Vendor");

        end else begin
            WarrantyReferanceEditable := true;
            WarrantyExpiryEditable := true;
            WarrantyVendorNoEditable := true;
            WarrantyVendorNameEditable := true;
            WarrantyVendorAdressEditable := true;
        end;
    end;

    trigger OnInit();
    begin
        TotalRunTimeNonProdVisible := true;
        "Total Run Time - ProdVisible" := true;
        CapacityUnitofMeasureEditable := true;
        "Is In UseEditable" := true;
        StatutoryInspectionDueDateEdit := true;

        AMCStatusEditable := true;
        AMCStartDateEditable := true;
        AMCEndDateEditable := true;
        AMCVendorNoEditable := true;
        AMCVendorNameEditable := true;
        AMCVendorAddressEditable := true;
        WarrantyReferanceEditable := true;
        WarrantyExpiryEditable := true;
        WarrantyVendorNoEditable := true;
        WarrantyVendorNameEditable := true;
        WarrantyVendorAdressEditable := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        Rec."Machine Type" := Rec."Machine Type"::"Non-Production";
        Rec.Type := Rec.Type::" ";
    end;

    trigger OnOpenPage();
    begin
        StatutoryInspectionDueDateEdit := Rec."Statutory Inspection";
        UpdateRunTimeFlow();
        EquipmentStatus();
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean;
    begin

        if Rec."A.M.C" = Rec."A.M.C"::Yes then begin
            if Rec."A.M.Status" = Rec."A.M.Status"::" " then
                if not CONFIRM(Text00021Lbl) then
                    ERROR('');
            Rec.TESTFIELD("A.M.C Start Date");
            Rec.TESTFIELD("A.M.C End  Date");
        end;

        if Rec.Warranty = Rec.Warranty::Yes then begin
            if Rec."Warranty Referance" = '' then
                if not CONFIRM(Text00022Lbl) then
                    ERROR('');
            Rec.TESTFIELD("Warranty Expiry");
        end;

        if Rec."A.M.C" = Rec."A.M.C"::Yes then begin
            Rec.TESTFIELD("A.M.C Vendor No.");
            Rec.TESTFIELD("A.M.C Vendor Name");
            Rec.TESTFIELD("Address of A.M.C Vendor");
        end;

        if Rec.Warranty = Rec.Warranty::Yes then begin
            Rec.TESTFIELD("Warranty Vendor No.");
            Rec.TESTFIELD("Warranty Vendor Name");
            Rec.TESTFIELD("Address of Warranty Vendor");
        end;
    end;

    var
        MaintSchTemplate: Record "Maint. Schedule Template B2B";
        "Maint.schePart": Record "Maintenance Schedule Part B2B";
        PMJobHeader: Record "PM Job Header B2B";
        Equipment2: Record "Equipment B2B";
        MaintenanceschedulePartGRec: Record "Maintenance Schedule Part B2B";
        MaintenanceSchedulePart2: Record "Maintenance Schedule Part B2B";
        AttachmentGRec: Record "Attachment Documents B2B";
        AttachmentsDocumentPageGVar: Page "Attachments Document B2B";
        //Text002Lbl: Label 'Do you want to delete the picture of %1 %2?';
        TotProdTime: Decimal;
        TotalRunTime: Decimal;
        Text003Lbl: Label '"Mainteance schedule defined ,do you want add the lines? "';

        StatutoryInspectionDueDateEdit: Boolean;
        [InDataSet]
        "Is In UseEditable": Boolean;
        [InDataSet]
        TypeEditable: Boolean;
        [InDataSet]
        "M/W No.Editable": Boolean;
        [InDataSet]
        CapacityUnitofMeasureEditable: Boolean;
        [InDataSet]
        "Total Run Time - ProdVisible": Boolean;
        [InDataSet]
        TotalRunTimeNonProdVisible: Boolean;
        Text00010Lbl: Label 'Purchase Vendor';
        Text00011Lbl: Label 'Service Vendor';
        Text00012Lbl: Label 'A.M.C Vendor';
        Text00013Lbl: Label '"Warranty Vendor "';
        Text00014Lbl: Label 'A.M.C Details';
        Text00015Lbl: Label 'Warranty Details';
        Text00017Lbl: Label 'Fixed Asset Details';
        Text00018Lbl: Label 'Production Reference Details';
        Text00019Lbl: Label 'Other Details';
        Text00020Lbl: Label 'Dimensions';
        AMCStatusEditable: Boolean;
        AMCStartDateEditable: Boolean;
        AMCEndDateEditable: Boolean;
        WarrantyReferanceEditable: Boolean;
        WarrantyExpiryEditable: Boolean;
        AMCVendorNoEditable: Boolean;
        AMCVendorNameEditable: Boolean;
        AMCVendorAddressEditable: Boolean;
        WarrantyVendorNoEditable: Boolean;
        WarrantyVendorNameEditable: Boolean;
        WarrantyVendorAdressEditable: Boolean;
        Text00021Lbl: Label 'The A.M.C Status is empty.Would you like to exit ?';
        Text00022Lbl: Label 'Warranty Reference is empty.Would u like to Exit?';
        Text00023Lbl: Label 'Date of Purchased shouldnot be lessthan the Date of installed';
        Text00024Lbl: Label 'Date of purchased shouldnot be empty';
        Text00025Lbl: Label 'Warrenty Expiry shouldnot be lessthan the date of purchased';
        MachineTextLbl: Label 'You must specify the Type %1 and Machine No.', Comment = '%1 = Type';

    procedure AttachPartsToMachine(TemplateNoForAttach: Code[40]; AttachMachineNo: Code[20]; AttachMachineName: Text[50]);
    var
        MaintenanceParts: Record "Maintenance Schedule Part B2B" temporary;

        OriginalMaintenanceRec: Record "Maintenance Schedule Part B2B";
        SlNOgenerator: Integer;
        KeyGenerator: Integer;
    begin

        SlNOgenerator := 0;
        KeyGenerator := 0;

        PartsToGenerateNumber.RESET();
        PartsToGenerateNumber.SETCURRENTKEY("Sl.No.");
        if PartsToGenerateNumber.FIND('+') then
            SlNOgenerator := PartsToGenerateNumber."Sl.No.";
        SlNOgenerator += 1;

        PartsToGenerateNumber.RESET();

        PartsToGenerateNumber.SETCURRENTKEY("Line No.");
        if PartsToGenerateNumber.FIND('+') then
            KeyGenerator := PartsToGenerateNumber."Line No.";
        KeyGenerator += 1;
        PartsToGenerateNumber.RESET();


        PartsToGenerateNumber.SETRANGE("Maint. Sch. Template ID", TemplateNoForAttach);
        PartsToGenerateNumber.SETRANGE("Machine ID", '');

        if PartsToGenerateNumber.FIND('-') then
            repeat
                MaintenanceParts.INIT();
                MaintenanceParts."Sl.No." := SlNOgenerator;
                MaintenanceParts."Machine ID" := AttachMachineNo;
                MaintenanceParts."Line No." := KeyGenerator;
                MaintenanceParts."Machine Name" := AttachMachineName;
                MaintenanceParts."Component ID" := PartsToGenerateNumber."Component ID";
                MaintenanceParts."Component Name" := PartsToGenerateNumber."Component Name";
                MaintenanceParts."Frequency ID" := PartsToGenerateNumber."Frequency ID";
                MaintenanceParts."Frequency Name" := PartsToGenerateNumber."Frequency Name";
                MaintenanceParts."Maintenance Type" := PartsToGenerateNumber."Maintenance Type";
                MaintenanceParts."Maintenance Type Name" := PartsToGenerateNumber."Maintenance Type Name";
                MaintenanceParts.Description := PartsToGenerateNumber.Description;
                MaintenanceParts."Maint. Sch. Template ID" := PartsToGenerateNumber."Maint. Sch. Template ID";
                MaintenanceParts."Maint. Sch. Template Name" := PartsToGenerateNumber."Maint. Sch. Template Name";
                MaintenanceParts."Original ID" := PartsToGenerateNumber."No.";
                MaintenanceParts."Notice Days" := PartsToGenerateNumber."Notice Days";
                MaintenanceParts."Hrs Required" := PartsToGenerateNumber."Hrs Required";
                MaintenanceParts."Date Interval" := PartsToGenerateNumber."Date Interval";
                MaintenanceParts.INSERT();

                SlNOgenerator += 1;
                KeyGenerator += 1;
            until PartsToGenerateNumber.NEXT() = 0;

        if MaintenanceParts.FIND('-') then
            repeat
                OriginalMaintenanceRec.INIT();
                OriginalMaintenanceRec.TRANSFERFIELDS(MaintenanceParts);
                OriginalMaintenanceRec.INSERT(true);
                MaintenanceSchedulePart2.COPYFILTERS(OriginalMaintenanceRec);
                AttachPartLinesToMachine(OriginalMaintenanceRec."Original ID", OriginalMaintenanceRec."No.");
                AttachPartLinesToProcedures(OriginalMaintenanceRec."Original ID", OriginalMaintenanceRec."No.",
                OriginalMaintenanceRec."Machine ID", OriginalMaintenanceRec."Machine Name");
            until MaintenanceParts.NEXT() = 0;
    end;

    procedure AttachPartLinesToMachine(TemlateIDtoGetLines: Code[20]; MachinePartsID: Code[20]);
    var
        TempMntPartLines: Record "Equipment Schedule Line B2B" temporary;
        OriginalMntPartLines: Record "Equipment Schedule Line B2B";

        KeyGeneratorLine: Integer;
        SlNOgeneratorLine: Integer;
    begin
        SlNOgeneratorLine := 0;
        KeyGeneratorLine := 0;


        FilterPartLines.RESET();
        FilterPartLines.SETCURRENTKEY("Sl.No.");
        if FilterPartLines.FIND('+') then
            SlNOgeneratorLine := FilterPartLines."Sl.No.";
        SlNOgeneratorLine += 1;

        FilterPartLines.RESET();

        FilterPartLines.SETCURRENTKEY("Line No.");
        FilterPartLines.FIND('+');
        KeyGeneratorLine := FilterPartLines."Line No.";
        KeyGeneratorLine += 1;
        FilterPartLines.RESET();

        FilterPartLines.SETRANGE("Schedule Template ID", TemlateIDtoGetLines);
        if FilterPartLines.FIND('-') then begin
            repeat
                TempMntPartLines.INIT();
                TempMntPartLines."Sl.No." := SlNOgeneratorLine;
                TempMntPartLines."Line No." := KeyGeneratorLine;
                TempMntPartLines."Schedule Template ID" := MachinePartsID;
                TempMntPartLines."Line Type" := FilterPartLines."Line Type";
                TempMntPartLines."Line Type Name" := FilterPartLines."Line Type Name";
                TempMntPartLines.Description := FilterPartLines.Description;
                TempMntPartLines."Time Required" := FilterPartLines."Time Required";
                TempMntPartLines."I/R Code" := FilterPartLines."I/R Code";
                TempMntPartLines."I/R Description" := FilterPartLines."I/R Description";
                TempMntPartLines.Quantity := FilterPartLines.Quantity;
                TempMntPartLines."Unit Cost" := FilterPartLines."Unit Cost";
                TempMntPartLines.UOM := FilterPartLines.UOM;
                TempMntPartLines.Amount := FilterPartLines.Amount;
                TempMntPartLines.INSERT();
                SlNOgeneratorLine += 1;
                KeyGeneratorLine += 1;
            until FilterPartLines.NEXT() = 0;

            if TempMntPartLines.FIND('-') then
                OriginalMntPartLines.LOCKTABLE();
            repeat
                OriginalMntPartLines.INIT();
                OriginalMntPartLines.TRANSFERFIELDS(TempMntPartLines);
                OriginalMntPartLines.INSERT(true);
            until TempMntPartLines.NEXT() = 0;
        end;
    end;

    procedure AttachPartLinesToProcedures(TemlateIDtoProcedureGetLines: Code[20]; MachineProcedurePartsID: Code[20]; MachineId: Code[20]; MachineName: Text[50]);
    var
        TempMntPartProcedureLines: Record "Maint. Sched. Line Proc B2B" temporary;
        OriginalMntPartProcedureLines: Record "Maint. Sched. Line Proc B2B";

        KeyGeneratorProcedureLine: Integer;
        SlNOgeneratorProcedureLine: Integer;
    begin

        SlNOgeneratorProcedureLine := 0;
        KeyGeneratorProcedureLine := 0;

        FilterPartProcedureLines.RESET();
        FilterPartProcedureLines.SETCURRENTKEY("Sl.No.");
        if FilterPartProcedureLines.FIND('+') then
            SlNOgeneratorProcedureLine := FilterPartProcedureLines."Sl.No.";
        SlNOgeneratorProcedureLine += 1;

        FilterPartProcedureLines.RESET();

        FilterPartProcedureLines.SETCURRENTKEY("Line No.");
        if FilterPartProcedureLines.FIND('+') then
            KeyGeneratorProcedureLine := FilterPartProcedureLines."Line No.";
        KeyGeneratorProcedureLine += 1;
        FilterPartProcedureLines.RESET();

        FilterPartProcedureLines.SETRANGE("Machine Sched. Part No.", TemlateIDtoProcedureGetLines);
        if FilterPartProcedureLines.FIND('-') then begin
            repeat
                TempMntPartProcedureLines.INIT();
                TempMntPartProcedureLines."Sl.No." := SlNOgeneratorProcedureLine;
                TempMntPartProcedureLines."Line No." := KeyGeneratorProcedureLine;
                TempMntPartProcedureLines."Machine Sched. Line No." := KeyGeneratorProcedureLine;
                TempMntPartProcedureLines."Machine Sched. Part No." := MachineProcedurePartsID;
                TempMntPartProcedureLines."Step No." := FilterPartProcedureLines."Step No.";
                TempMntPartProcedureLines."Special Tools" := FilterPartProcedureLines."Special Tools";
                TempMntPartProcedureLines."Machine ID" := MachineId;
                TempMntPartProcedureLines."Machine Name" := MachineName;
                TempMntPartProcedureLines.Description := FilterPartProcedureLines.Description;
                TempMntPartProcedureLines.INSERT();
                SlNOgeneratorProcedureLine += 1;
                KeyGeneratorProcedureLine += 1;
            until FilterPartProcedureLines.NEXT() = 0;


            if TempMntPartProcedureLines.FIND('-') then begin
                OriginalMntPartProcedureLines.LOCKTABLE();
                repeat
                    OriginalMntPartProcedureLines.INIT();
                    OriginalMntPartProcedureLines.TRANSFERFIELDS(TempMntPartProcedureLines);
                    OriginalMntPartProcedureLines.INSERT(true);
                until TempMntPartProcedureLines.NEXT() = 0;
            end;
        end;
    end;

    procedure UpdateIdleTime();
    begin
        Rec.CALCFIELDS("Total Run Time Non Prod.");
        Rec.CALCFIELDS("Total Break Down Hours");
        Rec.CALCFIELDS("Total PMR Hours");

        if Rec."Machine Type" = Rec."Machine Type"::Production then
            Rec."Idle Time" := Rec."Total Capacity" -
                                    (Rec."Total Run Time Non Prod." + Rec."Total Break Down Hours" + Rec."Total PMR Hours")
        else
            Rec."Idle Time" := 0;

        PMJobHeader.RESET();
        PMJobHeader.SETRANGE("Machine ID", Rec."No.");
        if PMJobHeader.FIND('-') then begin
            Rec.MTBF := 0;
            if PMJobHeader.COUNT() > 0 then
                Rec.MTBF := Rec."Total Run Time Non Prod." / PMJobHeader.COUNT();
        end;
    end;

    procedure UpdateRunTime();
    begin
        CLEAR(TotalRunTime);
        if (Rec."Machine Type" = Rec."Machine Type"::Production) and (Rec."M/W No." <> '') then begin
            CapacityLedgerEntry.RESET();
            CapacityLedgerEntry.SETRANGE(Type, Rec.Type);
            CapacityLedgerEntry.SETRANGE("Work Center No.", Rec."M/W No.");
            if CapacityLedgerEntry.FINDSET() then
                repeat
                    TotalRunTime += CapacityLedgerEntry."Run Time";
                until EquipmentLog.NEXT() = 0;
        end else
            if (Rec."Machine Type" = Rec."Machine Type"::"Non-Production") or (Rec."M/W No." = '') then begin
                EquipmentLog.RESET();
                EquipmentLog.SETRANGE(Type, Rec.Type);
                EquipmentLog.SETRANGE("Work Center No.", Rec."M/W No.");
                if EquipmentLog.FINDSET() then
                    repeat
                        TotalRunTime += EquipmentLog."Time(Hrs)";
                    until EquipmentLog.NEXT() = 0;
            end;
    end;

    procedure UpdateRunTimeFlow();
    var
    begin
        CLEAR(TotalRunTime);
        if (Rec."Machine Type" = Rec."Machine Type"::Production) and (Rec."M/W No." <> '') then begin
            "Total Run Time - ProdVisible" := true;
            TotalRunTimeNonProdVisible := false;
        end else
            if (Rec."Machine Type" = Rec."Machine Type"::"Non-Production") or (Rec."M/W No." = '') then begin
                TotalRunTimeNonProdVisible := true;
                "Total Run Time - ProdVisible" := false;
            end;
    end;

    procedure EquipmentStatus();
    var
        PmJObHeaderRec: Record "PM Job Header B2B";
        BreakDownRec: Record "Breakdown Records B2B";

    begin
        Equipment.RESET();
        if Equipment.FINDFIRST() then
            repeat
                if not Equipment."Is In Use" then begin
                    Equipment."Equipment Status" := Equipment."Equipment Status"::" ";
                    Equipment.MODIFY();
                end else
                    if Equipment."Is In Use" then begin
                        PmJObHeaderRec.RESET();
                        PmJObHeaderRec.SETRANGE("Machine ID", Equipment."No.");
                        PmJObHeaderRec.SETRANGE(Type, PmJObHeaderRec.Type::PMR);
                        PmJObHeaderRec.SETRANGE(Posted, false);
                        if PmJObHeaderRec.FINDFIRST() then begin
                            Equipment."Equipment Status" := Equipment."Equipment Status"::"Under Preventive";
                            Equipment.MODIFY();
                        end else begin
                            PmJObHeaderRec.RESET();
                            PmJObHeaderRec.SETRANGE("Machine ID", Equipment."No.");
                            PmJObHeaderRec.SETRANGE(Type, PmJObHeaderRec.Type::BreakDown);
                            PmJObHeaderRec.SETRANGE(Posted, false);
                            if PmJObHeaderRec.FINDFIRST() then begin
                                Equipment."Equipment Status" := Equipment."Equipment Status"::"Under Breakdown";
                                Equipment.MODIFY();
                            end else begin
                                PmJObHeaderRec.RESET();
                                PmJObHeaderRec.SETRANGE("Machine ID", Equipment."No.");
                                PmJObHeaderRec.SETRANGE(Type, PmJObHeaderRec.Type::Others);
                                PmJObHeaderRec.SETRANGE(Type, PmJObHeaderRec.Type::Predictive);
                                PmJObHeaderRec.SETRANGE(Posted, false);
                                if Not PmJObHeaderRec.IsEmpty() then begin
                                    Equipment."Equipment Status" := Equipment."Equipment Status"::"Under Others";
                                    Equipment.MODIFY();
                                end else begin
                                    BreakDownRec.SETRANGE("Machine No.", Equipment."No.");
                                    BreakDownRec.SETRANGE(Status, BreakDownRec.Status::Open);
                                    BreakDownRec.SETRANGE(Posted, false);
                                    if Not BreakDownRec.IsEmpty() then begin
                                        Equipment."Equipment Status" := Equipment."Equipment Status"::"Under Complaint";
                                        Equipment.MODIFY();
                                    end else begin
                                        Equipment2.SETRANGE("No.", Rec."No.");
                                        if Equipment2.FINDFIRST() then begin
                                            Equipment."Equipment Status" := Equipment."Equipment Status"::Running;
                                            Equipment.MODIFY();
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
            until Equipment.NEXT() = 0;
    end;

    procedure CheckStatus();
    begin
        if Rec."Machine Type" <> Rec."Machine Type"::Production then begin
            Rec.Type := 2;
            Rec."M/W No." := '';
            Rec."M/W Description" := '';
        end;
        MachineTypeOnFormat();
    end;

    local procedure StatutoryInspectionOnAfterVali();
    begin
        StatutoryInspectionDueDateEdit := Rec."Statutory Inspection";
    end;

    local procedure MachineTypeOnFormat();
    begin
        if Rec."Machine Type" <> Rec."Machine Type"::Production then begin
            TypeEditable := false;
            "M/W No.Editable" := false;
            CapacityUnitofMeasureEditable := true;
        end else begin
            TypeEditable := true;
            "M/W No.Editable" := true;
            CapacityUnitofMeasureEditable := false;
        end;


        if Rec."Machine Type" <> Rec."Machine Type"::Production then begin
            Rec.Type := 2;
            Rec."M/W No." := '';
            Rec."M/W Description" := '';
        end;
    end;

    var
        PartsToGenerateNumber: Record "Maintenance Schedule Part B2B";
        FilterPartLines: Record "Equipment Schedule Line B2B";
        FilterPartProcedureLines: Record "Maint. Sched. Line Proc B2B";
        EquipmentLog: Record "Equipment Log B2B";
        CapacityLedgerEntry: Record "Capacity Ledger Entry";
        Equipment: Record "Equipment B2B";
}

