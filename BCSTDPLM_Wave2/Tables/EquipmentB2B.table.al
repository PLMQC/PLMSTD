table 33000891 "Equipment B2B"
{

    Caption = 'Equipment';
    DataCaptionFields = "No.", Name;
    DrillDownPageID = "Equipment List B2B";
    LookupPageID = "Equipment List B2B";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "No." <> xRec."No." then begin
                    MachineSetup.GET();
                    NoSeriesMgt.TestManual(MachineSetup."Machine Nos.");
                    "No. Series" := '';
                end;
            end;

        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if ("Search Name" = UPPERCASE(xRec.Name)) or ("Search Name" = '') then
                    "Search Name" := Name;
            end;

        }
        field(3; "Model No."; Code[20])
        {
            Caption = 'Model No.';
            DataClassification = CustomerContent;
        }
        field(4; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if VendorRec.GET("Vendor No.") then begin
                    "Vendor Name" := VendorRec.Name;
                    "Vendor Address" := VendorRec.Address;
                    "Vendor Address2" := VendorRec."Address 2";
                    City := VendorRec.City;
                    "Country Code" := VendorRec."Country/Region Code";
                    "Phone No." := VendorRec."Phone No.";
                    Contact := VendorRec.Contact;
                end else begin
                    "Vendor Name" := '';
                    "Vendor Address" := '';
                    "Vendor Address2" := '';
                    City := '';
                    "State Code" := '';
                    "Country Code" := '';
                    "Phone No." := '';
                    Contact := '';
                end;
            end;

        }
        field(5; Manufacturer; Text[250])
        {
            Caption = 'Manufacturer';
            DataClassification = CustomerContent;
        }
        field(6; "Serial No."; Text[30])
        {
            Caption = 'Serial No.';
            DataClassification = CustomerContent;
        }
        field(7; "Machine Location"; Code[20])
        {
            Caption = 'Plant ID';
            TableRelation = "Equipment Location B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if MachineLocation.GET("Machine Location") then
                    "Location Name" := MachineLocation.Description
                else
                    "Location Name" := '';
            end;

        }
        field(8; "Maintainanced By"; Code[20])
        {
            Caption = 'Maintainanced By';
            TableRelation = "Maintenanced By B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if MaintainanceBy.GET("Maintainanced By") then
                    Maintainer := MaintainanceBy.Description
                else
                    Maintainer := '';
            end;

        }
        field(9; "Service Vendor"; Code[20])
        {
            Caption = 'Service Vendor';
            TableRelation = Vendor;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if VendorRec.GET("Service Vendor") then begin
                    "Service Vendor Name" := VendorRec.Name;
                    "Service Contact Person" := VendorRec.Contact;
                    "Service Phone Number" := VendorRec."Phone No.";
                end else begin
                    "Service Vendor Name" := '';
                    "Service Contact Person" := '';
                    "Service Phone Number" := '';
                end;
            end;

        }
        field(10; Calibration; Code[20])
        {
            Caption = 'Calibration';
            TableRelation = "Calibration PLM B2B";
            DataClassification = CustomerContent;
            ObsoleteState = Pending;
            ObsoleteReason = 'Functionallity Removed';
            ObsoleteTag = '21.0';
            trigger OnValidate();
            var
                CalibrationRec: record "Calibration PLM B2B";
            begin
                if CalibrationRec.GET(Calibration) then
                    "Calibration Name" := CalibrationRec.Description
                else
                    "Calibration Name" := '';
            end;

        }
        field(11; "Equipment Type"; Code[20])
        {
            Caption = 'System';
            TableRelation = "Equipment Group B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if MachineType.GET("Equipment Type") then
                    "Equipment Name" := MachineType.Description
                else
                    "Equipment Name" := '';
            end;

        }
        field(12; Criticality; Code[20])
        {
            Caption = 'Criticality';
            TableRelation = "Criticality B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if CriticalityRec.GET(Criticality) then
                    "Criticality Option" := CriticalityRec.Description
                else
                    "Criticality Option" := '';
            end;

        }
        field(13; "Type of Use"; Code[20])
        {
            Caption = 'Type of Use';
            TableRelation = "Equipment Usage B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if MachineUsage.GET("Type of Use") then
                    "Usage Name" := MachineUsage.Description
                else
                    "Usage Name" := '';
            end;

        }
        field(14; Picture; MediaSet)
        {
            Caption = 'Picture';
            DataClassification = CustomerContent;
        }
        field(15; "Warranty Referance"; Text[30])
        {
            Caption = 'Warranty Referance';
            DataClassification = CustomerContent;
        }
        field(16; "Warranty Expiry"; Date)
        {
            Caption = 'Warranty Expiry';
            DataClassification = CustomerContent;
        }
        field(18; "Fixed Asset Code"; Code[20])
        {
            Caption = 'Fixed Asset Code';
            TableRelation = "Fixed Asset";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if FixedAssetRec.GET("Fixed Asset Code") then
                    "Fixed Asset Name" := FixedAssetRec.Description
                else
                    "Fixed Asset Name" := '';
            end;

        }
        field(19; "Item Code"; Code[20])
        {
            Caption = 'Item Code';
            TableRelation = Item;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if ItemRec.GET("Item Code") then
                    "Item Name" := ItemRec.Description
                else
                    "Item Name" := '';
            end;

        }
        field(20; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(21; "Maintainance Unit"; Code[20])
        {
            Caption = 'Maintainance Unit';
            TableRelation = "Maintenance Unit B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if MaintainanceUnitRec.GET("Maintainance Unit") then
                    "Maintainance Unit Name" := MaintainanceUnitRec.Description
                else
                    "Maintainance Unit Name" := '';
            end;

        }
        field(22; "Is In Use"; Boolean)
        {
            Caption = 'Is In Use';
            DataClassification = CustomerContent;
        }
        field(23; "Statutory Inspection"; Boolean)
        {
            Caption = 'Statutory Inspection';
            DataClassification = CustomerContent;
        }
        field(24; "Statutory Inspection Due Date"; Date)
        {
            Caption = 'Statutory Inspection Due Date';
            DataClassification = CustomerContent;
        }
        field(25; "Parent Machine Reference"; Code[20])
        {
            Caption = 'Parent Machine Reference';
            TableRelation = "Equipment B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if MachineRec.GET("Parent Machine Reference") then
                    "Machine Ref. Name" := MachineRec.Name
                else
                    "Machine Ref. Name" := '';
            end;

        }
        field(26; "Cost Center"; Code[10])
        {
            Caption = 'Cost Center';
            DataClassification = CustomerContent;
        }
        field(27; URL; Text[250])
        {
            Caption = 'URL';
            ExtendedDatatype = URL;
            DataClassification = CustomerContent;
        }
        field(28; "Service Contact Person"; Text[100])
        {
            Caption = 'Service Contact Person';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(29; "Service Phone Number"; Text[30])
        {
            Caption = 'Service Phone Number';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(30; "Template No."; Code[20])
        {
            Caption = 'Template No.';
            TableRelation = "Specification Templates B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            var
                LineNum: Integer;
                SpecNum: Integer;
            begin
                if SpecTemplates.GET("Template No.") then
                    "Template Name" := SpecTemplates.Description
                else
                    "Template Name" := '';

                if Rec."Template No." <> xRec."Template No." then begin
                    Spec.RESET();
                    Spec.SETRANGE("Machine ID", "No.");
                    if Spec.FINDFIRST() then
                        Spec.DELETEALL();


                    Spec.RESET();
                    Spec.SETRANGE("Machine ID", "No.");
                    if Spec.FINDLAST() then begin
                        SpecNum := Spec."No.";
                        LineNum := Spec."Line No.";
                    end else begin
                        SpecNum := 1;
                        LineNum := 10000;
                    end;

                    SpecTemplate.RESET();
                    SpecTemplate.SETRANGE("Spec Temp ID", "Template No.");
                    if SpecTemplate.FINDFIRST() then
                        repeat
                            Spec.INIT();
                            Spec."No." := SpecNum;
                            Spec."Machine ID" := "No.";
                            Spec."Line No." := LineNum;
                            Spec."Machine Name" := Name;
                            Spec."Spec. Group ID" := SpecTemplate."Spec Group ID";
                            Spec."Spec. ID" := SpecTemplate."Spec ID";
                            Spec.Description := SpecTemplate.Description;
                            Spec."Specification Group Name" := SpecTemplate."Specification Group Name";
                            Spec."Specification Name" := SpecTemplate."Specification Name";
                            Spec.INSERT();
                            SpecNum := SpecNum + 1;
                            LineNum := LineNum + 10000;
                        until SpecTemplate.NEXT() = 0;
                end;
            end;

        }
        field(31; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(32; "Location Name"; Text[50])
        {
            Caption = 'Location Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(33; "Calibration Name"; Text[50])
        {
            Caption = 'Calibration Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(34; "Equipment Name"; Text[50])
        {
            Caption = 'Equipment Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(35; "Fixed Asset Name"; Text[100])
        {
            Caption = 'Fixed Asset Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(36; "Item Name"; Text[100])
        {
            Caption = 'Item Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(37; "Criticality Option"; Text[50])
        {
            Caption = 'Criticality Option';
            Editable = false;
            TableRelation = "Criticality B2B";
            DataClassification = CustomerContent;
        }
        field(38; "Usage Name"; Text[50])
        {
            Caption = 'Usage Name';
            Editable = false;
            TableRelation = "Equipment Usage B2B";
            DataClassification = CustomerContent;
        }
        field(39; "Machine Ref. Name"; Text[50])
        {
            Caption = 'Machine Ref. Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(40; "Template Name"; Text[50])
        {
            Caption = 'Template Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(41; "Cost Center Name"; Text[50])
        {
            Caption = 'Cost Center Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(42; Maintainer; Text[50])
        {
            Caption = 'Maintainer';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(43; "Maintainance Unit Name"; Text[50])
        {
            Caption = 'Maintainance Unit Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(44; Capacity; Code[20])
        {
            Caption = 'Capacity';
            DataClassification = CustomerContent;
        }
        field(45; "Year of Purchase"; Date)
        {
            Caption = 'Year of Purchase';
            DataClassification = CustomerContent;
        }
        field(46; "Source of Spares"; Text[50])
        {
            Caption = 'Source of Spares';
            TableRelation = Vendor;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if VendorRec.GET("Source of Spares") then
                    "Tele. No." := VendorRec."Phone No."
                else
                    "Tele. No." := '';
            end;

        }
        field(47; "Tele. No."; Text[30])
        {
            Caption = 'Tele. No.';
            DataClassification = CustomerContent;
        }
        field(48; "Service Vendor Name"; Text[100])
        {
            Caption = 'Service Vendor Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(49; "Manufacturer Address"; Text[80])
        {
            Caption = 'Manufacturer Address';
            DataClassification = CustomerContent;
        }
        field(50; "Vendor Address"; Text[100])
        {
            Caption = 'Vendor Address';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(51; "Vendor Address2"; Text[50])
        {
            Caption = 'Vendor Address2';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(52; City; Text[30])
        {
            Caption = 'City';
            Editable = false;
            TableRelation = "Post Code";
            DataClassification = CustomerContent;
        }
        field(53; "State Code"; Code[10])
        {
            Caption = 'State Code';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(54; "Country Code"; Code[10])
        {
            Caption = 'Country Code';
            Editable = false;
            TableRelation = "Country/Region";
            DataClassification = CustomerContent;
        }
        field(55; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(56; Contact; Text[100])
        {
            Caption = 'Contact';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(57; "Manufacturer Address2"; Text[50])
        {
            Caption = 'Manufacturer Address2';
            DataClassification = CustomerContent;
        }
        field(58; "Post Code/City"; Text[30])
        {
            Caption = 'Post Code/City';
            TableRelation = "Post Code";
            DataClassification = CustomerContent;
        }
        field(59; "Mfc Phone No."; Text[30])
        {
            Caption = 'Mfc Phone No.';
            DataClassification = CustomerContent;
        }
        field(60; "Mfc Contact"; Text[30])
        {
            Caption = 'Mfc Contact';
            DataClassification = CustomerContent;
        }
        field(70; "Total Run Time Non Prod."; Decimal)
        {

            CalcFormula = Sum("Equipment Log B2B"."Time(Hrs)" WHERE(Type = CONST("Run Time"),
                                                                 "Machine No." = FIELD("No.")));
            Caption = '"Total Run Time "';
            Editable = false;
            FieldClass = FlowField;

        }
        field(71; "Total Break Down Hours"; Decimal)
        {
            CalcFormula = Sum("Equipment Log B2B"."Time(Hrs)" WHERE(Type = FILTER("Stop Time"),
                                                                 "Machine No." = FIELD("No."),
                                                                 "P/B Type" = CONST(BreakDown)));
            Caption = 'Total Break Down Hours';
            Editable = false;
            FieldClass = FlowField;

        }
        field(72; "Total PMR Hours"; Decimal)
        {
            CalcFormula = Sum("Equipment Log B2B"."Time(Hrs)" WHERE(Type = FILTER("Stop Time"),
                                                                 "Machine No." = FIELD("No."),
                                                                 "P/B Type" = CONST(PMR)));
            Caption = 'Total PMR Hours';
            Editable = false;
            FieldClass = FlowField;

        }
        field(73; "Total Break Down Cost"; Decimal)
        {
            CalcFormula = Sum("Work Sheet B2B".Amount WHERE("Machine ID" = FIELD("No."),
                                                         "Job Posted" = CONST(true)));
            Caption = 'Total Break Down Cost';
            Editable = false;
            FieldClass = FlowField;

        }
        field(74; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = '"Work Center,Machine Center, "';
            OptionMembers = "Work Center","Machine Center"," ";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                CheckLedgerEntries();
                VALIDATE("M/W No.", '');
            end;

        }
        field(75; "M/W No."; Code[20])
        {
            Caption = 'M/W No.';
            TableRelation = IF (Type = CONST("Machine Center")) "Machine Center"
            ELSE
            IF (Type = CONST("Work Center")) "Work Center";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                case Type of
                    Type::"Work Center":
                        begin
                            if WorkCenter.GET("M/W No.") then;
                            WorkCenter.TESTFIELD(Blocked, false);
                            "M/W No." := WorkCenter."No.";
                            "M/W Description" := WorkCenter.Name;
                            "Capacity Unit of Measure" := WorkCenter."Unit of Measure Code";

                        end;
                    Type::"Machine Center":
                        begin
                            if MachineCenter.GET("M/W No.") then;
                            MachineCenter.TESTFIELD(Blocked, false);
                            "M/W No." := MachineCenter."No.";
                            "M/W Description" := MachineCenter.Name;
                        end;
                end;
            end;

        }
        field(76; "M/W Description"; Text[100])
        {
            Caption = 'M/W Description';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(77; "Total Capacity"; Decimal)
        {
            Caption = 'Total Capacity';
            DataClassification = CustomerContent;
        }
        field(78; "Idle Time"; Decimal)
        {
            Caption = 'Idle Time';
            DataClassification = CustomerContent;
        }
        field(79; MTBF; Decimal)
        {
            Caption = 'MTBF';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(80; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(81; "Machine Type"; Option)
        {
            Caption = 'Machine Type';
            OptionCaption = 'Production,Non-Production';
            OptionMembers = Production,"Non-Production";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                CheckLedgerEntries();
            end;

        }
        field(82; "Total Run Time - Prod"; Decimal)
        {
            CalcFormula = Sum("Equipment Ledger Entry B2B"."Run Time" WHERE(Type = FIELD(Type),
                                                                         "No." = FIELD("M/W No."),
                                                                         "Machine Id" = FIELD("No.")));
            Caption = '"Total Run Time "';
            Editable = false;
            FieldClass = FlowField;

        }
        field(83; "Capacity Unit of Measure"; Code[10])
        {
            Caption = 'Capacity Unit of Measure';
            Editable = true;
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;
        }
        field(90; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate();
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;

        }
        field(91; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate();
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;

        }
        field(95; Comment; Boolean)
        {
            /*CalcFormula = Exist ("Comment Line" WHERE("Table Name" = CONST(Machine),
                                                      "No." = FIELD("No.")));*/
            Caption = 'Comment';
            FieldClass = FlowField;

        }
        field(96; "Last Reading"; Decimal)
        {
            Caption = 'Last Reading';
            DecimalPlaces = 2 : 2;
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(97; "Check List Code"; Code[20])
        {
            Caption = 'Check List Code';
            TableRelation = "Check List Header B2B"."No.";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                CheckMachineCheckList();
            end;

        }
        field(98; "Meter Reading"; Decimal)
        {
            CalcFormula = Sum("Equipment Log B2B".Meters WHERE(Type = CONST(Meters),
                                                            "Machine No." = FIELD("No.")));
            Caption = 'Meter Reading';
            Editable = false;
            FieldClass = FlowField;

        }
        field(99; "Equipment Status"; Option)
        {
            Caption = 'Equipment Status';
            Editable = false;
            OptionCaption = '" ,Running,Under Preventive,Under Breakdown,Under Others,Under Complaint"';
            OptionMembers = " ",Running,"Under Preventive","Under Breakdown","Under Others","Under Complaint";
            DataClassification = CustomerContent;
        }
        field(100; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
            DataClassification = CustomerContent;
        }
        field(101; "Date of Installed"; Date)
        {
            Caption = 'Date of Installed';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "Date of Installed" < "Year of Purchase" then
                    ERROR(Text005Msg);
            end;

        }
        field(102; "No.of Record"; Integer)
        {
            AutoIncrement = true;
            Caption = 'No.of Record';
            DataClassification = CustomerContent;
        }
        field(103; "A.M.C"; Option)
        {
            Caption = 'A.M.C';
            OptionCaption = '" ,Yes,No"';
            OptionMembers = " ",Yes,No;
            DataClassification = CustomerContent;
        }
        field(104; "A.M.C Vendor No."; Code[20])
        {
            Caption = 'A.M.C Vendor No.';
            Editable = true;
            TableRelation = Vendor."No.";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                VendorGRec.GET("A.M.C Vendor No.");
                "A.M.C Vendor Name" := VendorGRec.Name;
                "Address of A.M.C Vendor" := VendorGRec.Address;
            end;

        }
        field(105; "A.M.C Vendor Name"; Text[100])
        {
            Caption = 'A.M.C Vendor Name';
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(106; "Address of A.M.C Vendor"; Text[100])
        {
            Caption = 'Address of A.M.C Vendor';
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(107; "A.M.Status"; Option)
        {
            Caption = 'A.M.Status';
            Editable = true;
            OptionCaption = '" ,Open,Released"';
            OptionMembers = " ",Open,Released;
            DataClassification = CustomerContent;
        }
        field(108; "A.M.C Start Date"; Date)
        {
            Caption = 'A.M.C Start Date';
            DataClassification = CustomerContent;
        }
        field(109; "A.M.C End  Date"; Date)
        {
            Caption = 'A.M.C End  Date';
            DataClassification = CustomerContent;
        }
        field(110; Warranty; Option)
        {
            Caption = 'Warranty';
            OptionCaption = '" ,Yes,No"';
            OptionMembers = " ",Yes,No;
            DataClassification = CustomerContent;
        }
        field(111; "Warranty Vendor No."; Code[20])
        {
            Caption = 'Warranty Vendor No.';
            TableRelation = Vendor."No.";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                VendorGRec.GET("Warranty Vendor No.");
                "Warranty Vendor Name" := VendorGRec.Name;
                "Address of Warranty Vendor" := VendorGRec.Address;
            end;

        }
        field(112; "Warranty Vendor Name"; Text[100])
        {
            Caption = 'Warranty Vendor Name';
            DataClassification = CustomerContent;
        }
        field(113; "Address of Warranty Vendor"; Text[100])
        {
            Caption = 'Address of Warranty Vendor';
            DataClassification = CustomerContent;
        }
        field(114; Resource; Code[20])
        {
            Caption = 'Resource';
            TableRelation = Resource."No.";
            DataClassification = CustomerContent;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            DataClassification = CustomerContent;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup();
            begin
                ShowDimensions();
            end;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
        }
        key(Key2; "Search Name")
        {
        }
        key(Key3; "Machine Location")
        {
        }
        key(Key4; "Parent Machine Reference")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        CheckJobDetails();
    end;

    trigger OnInsert();
    begin
        if "No." = '' then begin
            MachineSetup.GET();
            MachineSetup.TESTFIELD("Machine Nos.");
            NoSeriesMgt.InitSeries(MachineSetup."Machine Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        MachineSetup: Record "Plant Maintenance Setup B2B";
        MachineMasterGlobal: Record "Equipment B2B";
        VendorRec: Record Vendor;
        FixedAssetRec: Record "Fixed Asset";
        ItemRec: Record Item;
        MachineRec: Record "Equipment B2B";
        WorkCenter: Record "Work Center";
        MachineCenter: Record "Machine Center";
        MachineLocation: Record "Equipment Location B2B";
        MaintainanceBy: Record "Maintenanced By B2B";
        MachineType: Record "Equipment Group B2B";
        CriticalityRec: Record "Criticality B2B";
        MachineUsage: Record "Equipment Usage B2B";
        CheckListLineLVar: Record "Check List Line B2B";
        MaintainanceUnitRec: Record "Maintenance Unit B2B";
        SpecTemplates: Record "Specification Templates B2B";
        SpecTemplate: Record "Specification Template B2B";
        Spec: Record "Specification B2B";
        MaintSchPartsDelete: Record "Maintenance Schedule Part B2B";
        MaintSchLinesDelete: Record "Equipment Schedule Line B2B";

        JobHeader: Record "PM Job Header B2B";
        MachCheckList: Record "Equipment Check List B2B";
        CheckListLine: Record "Check List Line B2B";
        MachCheckList2: Record "Equipment Check List B2B";
        VendorGRec: Record Vendor;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimMgt: Codeunit DimensionManagement;
        Text003Msg: Label 'M/C parameters cannot be changed as ledger entries exists.';

        Text00001Msg: Label 'Job is already existed for this Machine id : %1', Comment = '%1 = No.';
        Text004Msg: Label 'Check List is existing for %1 \Do you want to delete ?', Comment = '%1 = No.';
        Text005Msg: Label '"Date Installed  should not be Less than  Date purchased "';

    procedure AssistEdit(MachineMasterLocal: Record "Equipment B2B"): Boolean;
    begin
        MachineMasterGlobal := Rec;
        MachineSetup.GET();
        MachineSetup.TESTFIELD("Machine Nos.");
        if NoSeriesMgt.SelectSeries(MachineSetup."Machine Nos.", MachineMasterLocal."No. Series", MachineMasterGlobal."No. Series") then begin
            NoSeriesMgt.SetSeries(MachineMasterGlobal."No.");
            Rec := MachineMasterGlobal;
            exit(true);
        end;
    end;

    procedure OnDeleteCascade(MachineCode: Code[20]);
    var
        MachineSpecDelete: Record "Specification B2B";
        SparesDelete: Record "Spare B2B";
        MovementsDelete: Record "Movement B2B";
    begin
        MachineSpecDelete.SETRANGE("Machine ID", "No.");
        MachineSpecDelete.DELETEALL();
        SparesDelete.SETRANGE("Machine ID", "No.");
        SparesDelete.DELETEALL();
        MovementsDelete.SETRANGE("Machine ID", "No.");
        MovementsDelete.DELETEALL();

        MaintSchPartsDelete.SETRANGE("Machine ID", "No.");
        if MaintSchPartsDelete.FIND('-') then begin
            repeat
                MaintSchLinesDelete.SETRANGE("Schedule Template ID", MaintSchPartsDelete."No.");
                if MaintSchLinesDelete.FIND('-') then
                    MaintSchLinesDelete.DELETEALL();
            until MaintSchPartsDelete.NEXT() = 0;
            MaintSchPartsDelete.DELETEALL();
        end;
    end;

    procedure Attachments();
    var
        Attachment: Record "Attachment Documents B2B";
    begin
        Attachment.RESET();
        Attachment.SETRANGE("Storage Pointer", "No.");
        PAGE.RUNMODAL(PAGE::"Attachments Document B2B", Attachment);
    end;

    procedure CheckLedgerEntries();
    begin
        CALCFIELDS("Total Run Time Non Prod.");
        CALCFIELDS("Total Run Time - Prod");
        if ("Total Run Time Non Prod." <> 0) or ("Total Run Time - Prod" <> 0) then
            ERROR(Text003Msg);
    end;

    procedure CreateOthersMaintenanceJob(MachineNo: Code[20]; Description: Text[50]; MaintenanceType: Code[10]; Date: Date);
    var
        Machine: Record "Equipment B2B";
        PMJobHeader: Record "PM Job Header B2B";
        PMJobLine: Record "PM Job Line B2B";
        PlantMaintainanceSetup: Record "Plant Maintenance Setup B2B";
        InspecType: Record "Maintenance Type B2B";
        Text001Lbl: Label 'Job Card Created with Job no. :%1 Successfully for Others.', Comment = '%1 = No.';
        Text002Lbl: Label 'One or more required parameters are blank.';
    begin
        if ((MachineNo = '') or (Description = '')) then
            ERROR(Text002Lbl);

        PlantMaintainanceSetup.GET();
        Machine.GET(MachineNo);
        PMJobHeader.INIT();
        PMJobHeader."No." := NoSeriesMgt.GetNextNo(PlantMaintainanceSetup."Others Job Card", TODAY(), true);
        PMJobHeader."Machine ID" := MachineNo;
        PMJobHeader."Machine Name" := Machine.Name;
        PMJobHeader."Maintenance Type" := MaintenanceType;
        PMJobHeader."Work Center" := Machine."M/W No.";
        PMJobHeader.Type := PMJobHeader.Type::Others;
        PMJobHeader."Other Description" := Description;
        PMJobHeader."Created By" := Format(USERID());
        PMJobHeader."Created Date" := Date;
        PMJobHeader."Created Time" := TIME();
        PMJobHeader.Resource := Resource;
        PMJobHeader.INSERT(true);

        PMJobLine.INIT();
        PMJobLine."Job Header No." := PMJobHeader."No.";
        PMJobLine."Line No." := 10000;
        PMJobLine."Machine ID" := MachineNo;
        PMJobLine.Description := Description;
        PMJobLine."Maintenace Type" := PMJobHeader."Maintenance Type";
        InspecType.GET(PMJobHeader."Maintenance Type");
        PMJobLine."Maintenace Type Name" := InspecType.Description;
        PMJobLine.INSERT(true);
        MESSAGE(Text001Lbl, PMJobHeader."No.");
    end;

    procedure CheckJobDetails();
    begin
        JobHeader.RESET();
        JobHeader.SETRANGE("Machine ID", "No.");
        if JobHeader.FINDFIRST() then
            ERROR(Text00001Msg, "No.");
    end;

    procedure UpdatePLMCheckList();
    var
        RecordsInserted: Boolean;
        Text001Lbl: Label 'Do you want to update Check List?';
        Text002Lbl: Label 'Check List Updated Successfully';
        Text003Lbl: Label 'There is nothing to update';
    begin
        TESTFIELD("Check List Code");

        if not CONFIRM(Text001Lbl, true) then
            exit;

        CLEAR(RecordsInserted);
        CheckListLineLVar.RESET();
        CheckListLineLVar.SETRANGE("Document No.", "Check List Code");
        if CheckListLineLVar.FINDFIRST() then
            repeat
                MachCheckList.RESET();
                MachCheckList.SETRANGE("Machine ID", "No.");
                MachCheckList.SETRANGE(Code, CheckListLine.Code);
                MachCheckList.SETRANGE(Date, WORKDATE());
                if not MachCheckList.FINDFIRST() then begin
                    MachCheckList.INIT();
                    MachCheckList."Machine ID" := "No.";
                    MachCheckList."Machine Name" := Name;
                    MachCheckList.Code := CheckListLineLVar.Code;
                    MachCheckList.Description := CheckListLineLVar.Description;
                    MachCheckList.Date := WORKDATE();
                    if MachCheckList.INSERT() then
                        RecordsInserted := true;
                end;
            until CheckListLineLVar.NEXT() = 0;

        if RecordsInserted then
            MESSAGE(Text002Lbl)
        else
            MESSAGE(Text003Lbl);
    end;

    procedure UpdateCheckList();
    begin
        CheckListLine.SETRANGE("Document No.", "Check List Code");
        if CheckListLine.FINDFIRST() then begin
            MachCheckList.RESET();
            MachCheckList.SETRANGE("Machine ID", "No.");
            MachCheckList.SETRANGE("Check List No.", "Check List Code");
            repeat
                MachCheckList.SETRANGE(Code, CheckListLine.Code);
                if not MachCheckList.FINDFIRST() then begin
                    MachCheckList2.INIT();
                    MachCheckList2.VALIDATE("Machine ID", "No.");
                    MachCheckList2.VALIDATE(Code, CheckListLine.Code);
                    MachCheckList2.VALIDATE("Check List No.", "Check List Code");
                    MachCheckList2.INSERT(true);
                end;
            until CheckListLine.NEXT() = 0;
        end;
        COMMIT();
    end;

    procedure OpenCheckList();
    begin
        TESTFIELD("Check List Code");
        UpdateCheckList();
        MachCheckList.RESET();
        MachCheckList.SETRANGE("Machine ID", "No.");
        PAGE.RUNMODAL(33000959, MachCheckList);
    end;

    procedure CheckMachineCheckList();
    begin
        MachCheckList.RESET();
        MachCheckList.SETRANGE("Machine ID", "No.");
        MachCheckList.SETRANGE("Check List No.", xRec."Check List Code");
        MachCheckList2.COPYFILTERS(MachCheckList);
        if MachCheckList.FINDFIRST() then begin
            if not CONFIRM(Text004Msg, false, "No.") then
                ERROR('');
            MachCheckList2.DELETEALL(true);
        end;
    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20]);
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        if "No." <> '' then
            MODIFY();

        if OldDimSetID <> "Dimension Set ID" then
            MODIFY();

        DimMgt.SaveDefaultDim(DATABASE::"Equipment B2B", "No.", FieldNumber, ShortcutDimCode);
        MODIFY();
    end;

    procedure ShowDimensions();
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
           "Dimension Set ID", STRSUBSTNO('%1', "No."),
            "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");

        if OldDimSetID <> "Dimension Set ID" then
            MODIFY();
    end;
}

