page 33000932 "Equipment Card-Movements B2B"
{

    Caption = 'Equipment Card-Movements';
    DelayedInsert = false;
    MultipleNewLines = true;
    PageType = Document;
    SourceTable = "Equipment B2B";
    ApplicationArea = All;
    UsageCategory = Tasks;
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
                field(Manufacturer; Rec.Manufacturer)
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
                    ToolTip = 'It Defines Whether the Equipment is In Use.';
                }
                field(URL; Rec.URL)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines URL of the Equipment.';
                }
                field("Template Name"; Rec."Template Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Template Name.';
                    Editable = false;
                }
                field("Location Name"; Rec."Location Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Location name.';
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
                    ToolTip = 'It Defines The related picture.';
                }
            }
            part(Control1102152062; "Equipment Movements B2B")
            {
                ApplicationArea = all;
                SubPageLink = "Machine ID" = FIELD("No.");
            }
            group(Vendor)
            {
                Caption = 'Vendor';
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Vendor No..';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines vendor Name.';
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
                    ToolTip = 'It Defines vendor Address2.';
                    Editable = false;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines city.';
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
                    ToolTip = 'It Defines country code.';
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
                    ToolTip = 'It Defines Service contact Number.';
                    Editable = false;
                }
                field("Service Phone Number"; Rec."Service Phone Number")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Server phone Number.';
                    Editable = false;
                }
                field("Service Vendor Name"; Rec."Service Vendor Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Service Vendor Name.';
                    Editable = false;
                }
            }
            group(Details)
            {
                Caption = 'Details';
                field("Fixed Asset Name"; Rec."Fixed Asset Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines FA Name.';
                }
                field("Warranty Referance"; Rec."Warranty Referance")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Warranty Reference.';
                }
                field("Warranty Expiry"; Rec."Warranty Expiry")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Warranty expiry.';
                }
                field("Statutory Inspection"; Rec."Statutory Inspection")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Statutory Inspection.';
                }
                field("Statutory Inspection Due Date"; Rec."Statutory Inspection Due Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Statutory Inspection Due date.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Type of area.';
                    OptionCaption = '"Work Center,Machine Center, "';
                }
                field("M/W Description"; Rec."M/W Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines M/W Description.';
                    Caption = 'Description';
                }
                field("Year of Purchase"; Rec."Year of Purchase")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Year of Purchase.';
                }
                field(Capacity; Rec.Capacity)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines capacity.';
                }
                field("Calibration Name"; Rec."Calibration Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Capacity name.';
                }
                field("Source of Spares"; Rec."Source of Spares")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Source of Spares.';
                }
                field("Tele. No."; Rec."Tele. No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines tele. No.';
                    Editable = false;
                }
            }
            group(ManufacturerNew2)
            {
                Caption = 'Manufacturer';
                field("<ManufacturerNew>"; Rec.Manufacturer)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines manufacturer.';
                }
                field("Manufacturer Address"; Rec."Manufacturer Address")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Manufacturer Address.';
                    Caption = 'Address';
                    Editable = true;
                }
                field("Manufacturer Address2"; Rec."Manufacturer Address2")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Manufacturer Address2.';
                    Caption = 'Address2';
                    Editable = true;
                }
                field("Post Code/City"; Rec."Post Code/City")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Post Code/City.';
                    Editable = true;
                }
                field("Mfc Phone No."; Rec."Mfc Phone No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines MFC Phone No.';
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
                    Caption = 'Total Capacity (Hrs)';
                    Editable = false;
                }
                field("Total Break Down Hours"; Rec."Total Break Down Hours")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Total Breakdown Hours.';
                    Caption = 'Total BreakDown Time (Hrs)';
                    Editable = false;
                }
                field("Total PMR Hours"; Rec."Total PMR Hours")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines total PMR hours.';
                    Caption = 'Total PMR Time (Hrs)';
                    Editable = false;
                }
                field("Idle Time"; Rec."Idle Time")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Idle Time.';
                    Editable = false;
                }
                field("Total Break Down Cost"; Rec."Total Break Down Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Total Break down time.';
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
                    ToolTip = 'It Defines Function of Get Maintenance.';
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
                    ApplicationArea = all;
                    Caption = 'Attachment for Machine';
                    ToolTip = 'It Defines Machine Attachment.';
                    Image = MakeOrder;

                    trigger OnAction();
                    begin
                        Rec.Attachments();
                    end;
                }
                action(Specifications)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Specifications.';
                    Caption = 'Specifications';
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
                    ApplicationArea = all;
                    ToolTip = 'It Defines spares.';
                    Caption = 'Spares';
                    Image = Suggest;

                    trigger OnAction();
                    begin

                        MachineRec.RESET();
                        if MachineRec.GET(Rec."No.") then
                            PAGE.RUNMODAL(33000931, MachineRec);
                    end;
                }
                action("PMR/BreakDown")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines whether it is PMR/Breakdown.';
                    Caption = 'PMR/BreakDown';
                    Image = BreakRulesOff;

                    trigger OnAction();
                    begin

                        MachineRec.RESET();
                        if MachineRec.GET(Rec."No.") then
                            PAGE.RUNMODAL(33000933, MachineRec);
                    end;
                }
            }
        }
        area(processing)
        {
            action(Cmd1forURL)
            {
                ApplicationArea = all;
                ToolTip = 'It Defines URL.';
                PromotedOnly = true;
                Caption = 'Cmd1forURL';
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
        MachineRec: Record "Equipment B2B";
        FilterPartLines: Record "Equipment Schedule Line B2B";
        PartsToGenerateNumber: Record "Maintenance Schedule Part B2B";
        CalenderEntries: Record "Calendar Entry";
        PMJobHeader: Record "PM Job Header B2B";
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
                                  (Rec."Total Break Down Hours" + Rec."Total PMR Hours");
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

