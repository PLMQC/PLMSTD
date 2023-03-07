page 33000933 "Equi. Card-PMR/Break Down B2B"
{

    Caption = 'Equipment Card-PMR/Break Down';
    DelayedInsert = false;
    MultipleNewLines = true;
    PageType = Document;
    SourceTable = "Equipment B2B";
    ApplicationArea = All;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Equipment No.';
                    AssistEdit = true;
                    NotBlank = false;

                    trigger OnAssistEdit();
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.UPDATE();
                    end;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Equipment Name.';
                }
                field("Model No."; Rec."Model No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Model No.';
                }
                field("<ManufacturerNew>"; Rec.Manufacturer)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Manufacturer.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Serial No.';
                }
                field("Is In Use"; Rec."Is In Use")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines whether Equipment is in use or not.';
                }
                field(URL; Rec.URL)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines URL.';
                }
                field("Template Name"; Rec."Template Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Template No.';
                    Editable = false;
                }
                field("Location Name"; Rec."Location Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Location.';
                    Editable = false;
                }
                field("Equipment Name"; Rec."Equipment Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Equipment Name.';
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Picture of the Equipment.';
                }
            }
            part(EquipBreak; "Equipment Breakdown B2B")
            {
                SubPageLink = "Machine ID" = FIELD("No.");
                ApplicationArea = All;
            }

            group(MachineCard1)
            {
                Caption = 'Vendor';
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Vendor No.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Vendor name.';
                    Editable = false;
                }
                field("Vendor Address"; Rec."Vendor Address")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Vendor Address.';
                    Editable = false;
                }
                field("Vendor Address2"; Rec."Vendor Address2")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Vendor address2.';
                    Editable = false;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines City.';
                    Caption = 'Post Code/City';
                    Editable = false;
                }
                field("State Code"; Rec."State Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines State code.';
                    Editable = false;
                }
                field("Country Code"; Rec."Country Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Country code.';
                    Editable = false;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Phone No.';
                    Editable = false;
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Contact.';
                    Editable = false;
                }
            }
            group(Service)
            {
                Caption = 'Service';
                field("Service Vendor"; Rec."Service Vendor")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Service Vendor.';
                    Editable = true;
                }
                field("Service Contact Person"; Rec."Service Contact Person")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Service Vendor Contact Person.';
                    Editable = false;
                }
                field("Service Phone Number"; Rec."Service Phone Number")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Service phone Number.';
                    Editable = false;
                }
                field("Service Vendor Name"; Rec."Service Vendor Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines service Vendor Name.';
                    Editable = false;
                }
            }
            group(Details)
            {
                Caption = 'Details';
                field("Fixed Asset Name"; Rec."Fixed Asset Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines FA.';
                }
                field("Warranty Referance"; Rec."Warranty Referance")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Warranty Reference.';
                }
                field("Warranty Expiry"; Rec."Warranty Expiry")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Warranty Expiry.';
                }
                field("Statutory Inspection"; Rec."Statutory Inspection")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Statutory Inspection.';
                }
                field("Statutory Inspection Due Date"; Rec."Statutory Inspection Due Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Statutory Inspection Due Date.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Type.';
                    OptionCaption = '"Work Center,Machine Center, "';
                }
                field("M/W No."; Rec."M/W No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines M/W No.';
                }
                field("M/W Description"; Rec."M/W Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines M/W Description.';
                }
                field("Year of Purchase"; Rec."Year of Purchase")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Year Of Purchase.';
                }
                field(Capacity; Rec.Capacity)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines capacity.';
                }
                field("Calibration Name"; Rec."Calibration Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines capacity name.';
                }
                field("Source of Spares"; Rec."Source of Spares")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Source of Spares.';
                }
                field("Tele. No."; Rec."Tele. No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Tel No.';
                    Editable = false;
                }
            }
            group(Manufacturer)
            {
                Caption = 'Manufacturer';
                field("<ManufacturerNew2>"; Rec.Manufacturer)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Manufacturer.';
                }
                field("Manufacturer Address"; Rec."Manufacturer Address")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Manufacturer Address.';
                    Editable = true;
                }
                field("Manufacturer Address2"; Rec."Manufacturer Address2")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Manufaturer address2.';
                    Caption = 'Address2';
                    Editable = true;
                }
                field("Post Code/City"; Rec."Post Code/City")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Post code/city.';
                    Editable = true;
                }
                field("Mfc Phone No."; Rec."Mfc Phone No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines MFC Phone  no.';
                    Caption = 'Phone No.';
                    Editable = true;
                }
                field("Mfc Contact"; Rec."Mfc Contact")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines MFC contact.';
                    Caption = 'Contact';
                    Editable = true;
                }
            }
            group(History)
            {
                Caption = 'History';
                field("Total Capacity"; Rec."Total Capacity")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Total capacity.';
                    Editable = false;
                }
                field("Total Run Time Non Prod."; Rec."Total Run Time Non Prod.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Total Run time Non production.';
                    Caption = 'Total Run Time (Hrs)';
                    Editable = false;
                }
                field("Total Break Down Hours"; Rec."Total Break Down Hours")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Total breakdown time.';
                    Caption = 'Total BreakDown Time (Hrs)';
                    Editable = false;
                }
                field("Total PMR Hours"; Rec."Total PMR Hours")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Total PMR time.';
                    Caption = 'Total PMR Time (Hrs)';
                    Editable = false;
                }
                field("Idle Time"; Rec."Idle Time")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Idle time.';
                    Editable = false;
                }
                field("Total Break Down Cost"; Rec."Total Break Down Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Breakdown cost.';
                    DrillDownPageID = "PM Job List B2B";
                    Editable = false;
                }
                field(MTBF; Rec.MTBF)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines MTBF.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(FunctionMenu1)
            {
                Caption = 'F&unctions';
                action(GetMnt)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Get Miantenance function.';
                    Caption = 'Get Maintenance';
                    Image = MakeOrder;
                    RunObject = Page "Maint. Machine Schedule B2B";
                    RunPageLink = "Machine ID" = FIELD("No.");
                }
                separator(Separator1102152031)
                {
                }
                action(AtchMachine)
                {
                    Caption = 'Attachment for Machine';
                    ApplicationArea = all;
                    ToolTip = 'It Defines Attachment.';
                    Image = MakeAgreement;

                    trigger OnAction();
                    begin
                        Rec.Attachments();
                    end;
                }
                action(Specifications)
                {
                    Caption = 'Specifications';
                    ApplicationArea = all;
                    ToolTip = 'It Defines Specification.';
                    Image = SpecialOrder;

                    trigger OnAction();
                    begin

                        MachineRec.RESET();
                        if MachineRec.GET(Rec."No.") then
                            PAGE.RUNMODAL(33000892, MachineRec);
                    end;
                }
                action(Spares)
                {
                    Caption = 'Spares';
                    ApplicationArea = all;
                    ToolTip = 'It Defines Spares.';
                    Image = Splitlines;

                    trigger OnAction();
                    begin

                        MachineRec.RESET();
                        if MachineRec.GET(Rec."No.") then
                            PAGE.RUNMODAL(33000931, MachineRec);
                    end;
                }
                action(Movements)
                {
                    Caption = 'Movements';
                    ApplicationArea = all;
                    ToolTip = 'It Defines Movement.';
                    Image = CreateMovement;

                    trigger OnAction();
                    begin

                        MachineRec.RESET();
                        if MachineRec.GET(Rec."No.") then
                            PAGE.RUNMODAL(33000932, MachineRec);
                    end;
                }
            }
        }
        area(processing)
        {
            action(Cmd1forURL)
            {
                Caption = 'Cmd1forURL';
                PromotedOnly = true;
                ApplicationArea = all;
                ToolTip = 'It Defines URL.';
                Image = Link;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    Rec.TESTFIELD(URL);
                    HYPERLINK(Rec.URL);
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        xRec := Rec;
        tothours := 0;
        CalenderEntries.RESET();
        CalenderEntries.SETRANGE(CalenderEntries."No.", Rec."M/W No.");
        CalenderEntries.SETFILTER(Date, '..%1', WORKDATE());

        if CalenderEntries.FINDFIRST() then
            repeat
                tothours += CalenderEntries."Capacity (Effective)";
            until CalenderEntries.NEXT() = 0;

        Rec."Total Capacity" := tothours / 60;

        UpdateIdleTime();
    end;

    trigger OnDeleteRecord(): Boolean;
    begin
        Rec.OnDeleteCascade(Rec."No.");
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        xRec := Rec;
        tothours := 0;
        CalenderEntries.RESET();
        CalenderEntries.SETRANGE(CalenderEntries."No.", Rec."M/W No.");
        CalenderEntries.SETFILTER(Date, '..%1', WORKDATE());

        if CalenderEntries.FINDFIRST() then
            repeat
                tothours += CalenderEntries."Capacity (Effective)";
            until CalenderEntries.NEXT() = 0;

        Rec."Total Capacity" := tothours / 60;

        UpdateIdleTime();
    end;

    trigger OnOpenPage();
    begin
        Rec.RESET();
        UpdateIdleTime();
    end;

    var
        PMJobHeader: Record "PM Job Header B2B";
        FilterPartLines: Record "Equipment Schedule Line B2B";
        MachineRec: Record "Equipment B2B";
        PartsToGenerateNumber: Record "Maintenance Schedule Part B2B";
        CalenderEntries: Record "Calendar Entry";
        tothours: Decimal;

    procedure AttachPartsToMachine(TemplateNoForAttach: Code[20]; AttachMachineNo: Code[20]; AttachMachineName: Text[50]);
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
        PartsToGenerateNumber.FIND('+');
        SlNOgenerator := PartsToGenerateNumber."Sl.No.";
        SlNOgenerator += 1;

        PartsToGenerateNumber.RESET();

        PartsToGenerateNumber.SETCURRENTKEY("Line No.");
        PartsToGenerateNumber.FIND('+');
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
                MaintenanceParts."Notice Days" := PartsToGenerateNumber."Notice Days";
                MaintenanceParts.INSERT();
                SlNOgenerator += 1;
                KeyGenerator += 1;
            until PartsToGenerateNumber.NEXT() = 0;

        if MaintenanceParts.FIND('-') then
            repeat
                OriginalMaintenanceRec.INIT();
                OriginalMaintenanceRec.TRANSFERFIELDS(MaintenanceParts);
                OriginalMaintenanceRec.INSERT(true);
                AttachPartLinesToMachine(OriginalMaintenanceRec."Original ID", OriginalMaintenanceRec."No.");
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
        FilterPartLines.FIND('+');
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

            if TempMntPartLines.FIND('-') then begin
                OriginalMntPartLines.LOCKTABLE();
                repeat
                    OriginalMntPartLines.INIT();
                    OriginalMntPartLines.TRANSFERFIELDS(TempMntPartLines);
                    OriginalMntPartLines.INSERT(true);
                until TempMntPartLines.NEXT() = 0;
            end;
        end;
    end;

    procedure UpdateIdleTime();
    begin

        Rec.CALCFIELDS("Total Break Down Hours");
        Rec.CALCFIELDS("Total PMR Hours");
        Rec."Idle Time" := Rec."Total Capacity" -
                                  (1 + Rec."Total Break Down Hours" + Rec."Total PMR Hours");
        PMJobHeader.RESET();
        PMJobHeader.SETRANGE("Machine ID", Rec."No.");
        if PMJobHeader.FIND('-') then begin
            Rec.MTBF := 0;
            if PMJobHeader.COUNT() > 0 then
                Rec.MTBF := 1 / PMJobHeader.COUNT();
        end;
    end;

    /*local procedure OnAfterGetCurrRecord();
    begin
        xRec := Rec;
        tothours := 0;
        CalenderEntries.RESET();
        CalenderEntries.SETRANGE(CalenderEntries."No.", "M/W No.");
        CalenderEntries.SETFILTER(Date, '..%1', WORKDATE());

        if CalenderEntries.FINDFIRST() then
            repeat
                tothours += CalenderEntries."Capacity (Effective)";
            until CalenderEntries.NEXT() = 0;

        "Total Capacity" := tothours / 60;

        UpdateIdleTime();
    end;*/
}

