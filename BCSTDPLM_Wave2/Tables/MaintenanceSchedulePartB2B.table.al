table 33000895 "Maintenance Schedule Part B2B"
{

    Caption = 'Maintainance Schedule Part';
    DrillDownPageID = "Maint. SchedulePart List B2B";
    LookupPageID = "Maint. SchedulePart List B2B";
    DataClassification = CustomerContent;
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
                    NoSeriesMgt.TestManual(MachineSetup."Maint. Sch. TemplateNos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Machine ID"; Code[20])
        {
            Caption = 'Machine ID';
            TableRelation = "Equipment B2B";
            DataClassification = CustomerContent;
            trigger OnValidate();
            begin
                if Machine.GET("Machine ID") then
                    "Machine Name" := Machine.Name
                else
                    "Machine Name" := '';
            end;
        }
        field(3; "Machine Name"; Text[50])
        {
            Caption = 'Machine Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(4; "Component ID"; Code[20])
        {
            Caption = 'Component ID';
            DataClassification = CustomerContent;
        }
        field(5; "Component Name"; Text[50])
        {
            Caption = 'Component Name';
            DataClassification = CustomerContent;
        }
        field(6; "Frequency ID"; Code[20])
        {
            Caption = 'Frequency';
            TableRelation = "Frequency  B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if FrequencyRec.GET("Frequency ID") then begin
                    "Frequency Name" := FrequencyRec.Description;
                    "Date Interval" := FrequencyRec."Time Interval";
                end else
                    "Frequency Name" := '';

                if "Start Date" <> 0D then
                    "Next Due Date" := CALCDATE("Date Interval", "Start Date")
            end;
        }
        field(7; "Frequency Name"; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(8; "Maintenance Type"; Code[20])
        {
            Caption = 'Maintenance Type';
            TableRelation = "Maintenance Type B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if InspectionTypeRec.GET("Maintenance Type") then
                    "Maintenance Type Name" := InspectionTypeRec.Description
                else
                    "Maintenance Type Name" := '';
            end;
        }
        field(9; "Maintenance Type Name"; Text[50])
        {
            Caption = 'Maintenance Type Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(11; "Sl.No."; Integer)
        {
            Caption = 'Sl.No.';
            DataClassification = CustomerContent;
        }
        field(12; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(13; "Maint. Sch. Template ID"; Code[20])
        {
            Caption = 'Maint. Sch. Template ID';
            DataClassification = CustomerContent;
            TableRelation = "Maint. Schedule Template B2B";

            trigger OnValidate();
            begin
                if MaintSchedTemp.GET("Maint. Sch. Template ID") then
                    "Maint. Sch. Template Name" := MaintSchedTemp.Description
                else
                    "Maint. Sch. Template Name" := '';
            end;
        }
        field(14; "Maint. Sch. Template Name"; Text[50])
        {
            Caption = 'Maint. Sch. Template Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(15; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(16; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(17; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin

                "Next Due Date" := CALCDATE("Date Interval", "Start Date");
            end;
        }
        field(18; "Original ID"; Code[20])
        {
            Caption = 'Original ID';
            DataClassification = CustomerContent;
        }
        field(19; "Notice Days"; Integer)
        {
            Caption = 'Notice Days';
            DataClassification = CustomerContent;
        }
        field(20; "Next Due Date"; Date)
        {
            Caption = 'Due Date';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                VALIDATE("Start Date");
            end;
        }
        field(21; "Hrs Required"; Decimal)
        {
            BlankZero = true;
            Caption = 'Estimated Time';
            DataClassification = CustomerContent;
        }
        field(30; "Date Interval"; DateFormula)
        {
            Caption = 'Date Interval';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin

                "Next Due Date" := CALCDATE("Date Interval", "Start Date");
            end;
        }
        field(31; "Resource Cost"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Equipment Schedule Line B2B".Amount WHERE("Schedule Template ID" = FIELD("No."),
                                                                      "Resource Equipment" = FILTER(true)));
            Caption = 'Planned Resource Cost';
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Spares Cost"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Equipment Schedule Line B2B".Amount WHERE("Schedule Template ID" = FIELD("No."),
                                                                      "Spares & Consumables" = FILTER(true)));
            Caption = 'Planned Spares Cost';
            Editable = false;
            FieldClass = FlowField;
        }
        field(33; "Total Cost"; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Equipment Schedule Line B2B".Amount WHERE("Schedule Template ID" = FIELD("No.")));
            Caption = 'Planned Total Cost';
            Editable = false;
            FieldClass = FlowField;
        }
        field(40; "Job Card Created"; Boolean)
        {
            Caption = 'Job Card Created';
            DataClassification = CustomerContent;
        }
        field(41; "Last Job Card Number"; Code[20])
        {
            Caption = 'Last Job Card Number';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(42; "RunTime Hours"; Decimal)
        {
            BlankZero = true;
            Caption = 'RunTime( Hrs )';
            Editable = false;
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "Frequency ID" <> RunTimeTextLbl then
                    ERROR(Text001Msg);
            end;
        }
        field(43; "Line Late Reading"; Decimal)
        {
            BlankZero = true;
            Caption = 'Previous Reading';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(45; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Open,Released';
            OptionMembers = Open,Released;
            DataClassification = CustomerContent;
        }
        field(59; "Frequency Code"; Code[20])
        {
            Caption = 'Frequency Code';
            TableRelation = "Runtime Frequency Header B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                Frequency.GET("Frequency ID");
                Frequency.TESTFIELD("Run Time");

                if "Job Card Created" then
                    ERROR(Text002Msg)
                else begin
                    MaintenanceschedulePart.RESET();
                    MaintenanceschedulePart.SETRANGE("Frequency Code", "Frequency Code");
                    if MaintenanceschedulePart.FINDFIRST() then
                        ERROR(Text003Msg)
                end;
                if RuntimeFreqHeader.GET("Frequency Code") then
                    if RuntimeFreqHeader.Status = RuntimeFreqHeader.Status::Certified then begin
                        "Start Date" := RuntimeFreqHeader."Start Date";
                        RuntimeFreqLine.RESET();
                        RuntimeFreqLine.SETRANGE("Frequency Code", "Frequency Code");
                        RuntimeFreqLine.SETRANGE("Job Card Created", false);
                        if RuntimeFreqLine.FINDFIRST() then
                            if RuntimeFreqLine.Type = RuntimeFreqLine.Type::Variable then begin
                                "Date Interval" := RuntimeFreqLine.Period;
                                VALIDATE("Start Date");
                            end else begin
                                "Date Interval" := RuntimeFreqLine.Period;
                                VALIDATE("Start Date");
                            end;
                    end else
                        ERROR(Text004Msg);
            end;
        }
        field(60; "Frequency Code Line No."; Integer)
        {
            Caption = 'Frequency Code Line No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(65; Meters; Decimal)
        {
            Caption = 'Meters';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(66; "Planned Res.Person Cost"; Decimal)
        {
            CalcFormula = Sum("Equipment Schedule Line B2B".Amount WHERE("Schedule Template ID" = FIELD("No."),
                                                                      "Resource Person" = FILTER(true)));
            Caption = 'Planned Res.Person Cost';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "No.", "Machine ID", "Frequency Name", "Line No.")
        {
        }
        key(Key2; "Sl.No.")
        {
        }
        key(Key3; "Line No.")
        {
        }
        key(Key4; "Machine ID")
        {
        }
        key(Key5; "Maint. Sch. Template Name")
        {
        }
        key(Key6; "Machine ID", "Next Due Date", "Frequency Name")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        MntPartLinesDelete.SETRANGE("Schedule Template ID", "No.");
        if MntPartLinesDelete.FIND('-') then
            MntPartLinesDelete.DELETEALL();
    end;

    trigger OnInsert();
    begin
        if "No." = '' then begin
            MachineSetup.GET();
            ;
            MachineSetup.TESTFIELD("Maint. Sch. TemplateNos.");
            NoSeriesMgt.InitSeries(MachineSetup."Maint. Sch. TemplateNos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        VALIDATE("Machine ID");
    end;

    var
        MachineSetup: Record "Plant Maintenance Setup B2B";
        RuntimeFreqLineLVar: Record "Runtime Frequency Line B2B";
        MaintSchPartsGlobal: Record "Maintenance Schedule Part B2B";
        MntPartLinesDelete: Record "Equipment Schedule Line B2B";
        Machine: Record "Equipment B2B";
        FrequencyRec: Record "Frequency  B2B";
        InspectionTypeRec: Record "Maintenance Type B2B";
        MaintSchedTemp: Record "Maint. Schedule Template B2B";
        Frequency: Record "Frequency  B2B";
        RuntimeFreqLine: Record "Runtime Frequency Line B2B";
        RuntimeFreqHeader: Record "Runtime Frequency Header B2B";
        MaintenanceschedulePart: Record "Maintenance Schedule Part B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Text001Msg: Label 'Frequency must be RUN TIME.';

        RunTimeTextLbl: Label 'RUN TIME';
        Text002Msg: Label 'Job card Created with the Frequency code.';
        Text003Msg: Label 'Frequency Code already assigned to another machine.';
        Text004Msg: Label 'Frequency must be certified.';

    procedure AssistEdit(MaintSchPartsLocal: Record "Maintenance Schedule Part B2B"): Boolean;
    begin
        MaintSchPartsGlobal := Rec;
        MachineSetup.GET();
        ;
        MachineSetup.TESTFIELD("Maint. Sch. TemplateNos.");
        if NoSeriesMgt.SelectSeries(MachineSetup."Maint. Sch. TemplateNos.", MaintSchPartsLocal."No. Series", MaintSchPartsGlobal."No. Series") then begin
            NoSeriesMgt.SetSeries(MaintSchPartsGlobal."No.");
            Rec := MaintSchPartsLocal;
            exit(true);
        end;
    end;

    procedure Attachments();
    var
        Attachment: Record "Attachment Documents B2B";
    begin
        Attachment.RESET();
        Attachment.SETRANGE("Table Id", DATABASE::"Maintenance Schedule Part B2B");
        Attachment.SETRANGE("Storage Pointer", "No.");
        PAGE.RUNMODAL(PAGE::"Attachments Document B2B", Attachment);
    end;

    procedure CalDueDateForRunTime();
    var
        TotProdTime: Decimal;
    begin
        Machine.GET("Machine ID");
        Machine.CALCFIELDS("Total Run Time Non Prod.");
        Machine.CALCFIELDS("Total Run Time - Prod");
        TotProdTime := Machine."Total Run Time Non Prod." + Machine."Total Run Time - Prod";

        RuntimeFreqLineLVar.SETRANGE("Frequency Code", "Frequency Code");
        if RuntimeFreqLineLVar.FINDFIRST() and ("Frequency Code Line No." = 0) then
            repeat
                if (TotProdTime >= RuntimeFreqLineLVar."Min. Interval") and
                  (TotProdTime <= RuntimeFreqLineLVar."Max. Interval") then begin
                    "Next Due Date" := CALCDATE(RuntimeFreqLineLVar.Period, "Start Date");
                    "Frequency Code Line No." := RuntimeFreqLineLVar."Line No.";
                end;
            until RuntimeFreqLineLVar.NEXT() = 0
        else begin
            RuntimeFreqLineLVar.RESET();
            if RuntimeFreqLineLVar.GET("Frequency Code", "Frequency Code Line No." + 10000) then begin
                "Next Due Date" := CALCDATE(RuntimeFreqLineLVar.Period, "Start Date");
                "Frequency Code Line No." := RuntimeFreqLineLVar."Line No.";
            end else
                if RuntimeFreqLineLVar.FINDLAST() and (RuntimeFreqLineLVar.Type = RuntimeFreqLineLVar.Type::Fixed) then begin
                    "Next Due Date" := CALCDATE(RuntimeFreqLineLVar.Period, "Start Date");
                    "Frequency Code Line No." := RuntimeFreqLineLVar."Line No.";
                end else
                    ERROR('');
        end;
    end;
}

