table 33000904 "PM Job Line B2B"
{

    Caption = 'PM Job Line';

    fields
    {
        field(1; "Job Header No."; Code[20])
        {
            Caption = 'Job Header No.';
            DataClassification = CustomerContent;
        }
        field(2; "Machine ID"; Code[20])
        {
            Caption = 'Machine ID';
            TableRelation = "Equipment B2B";
            DataClassification = CustomerContent;
        }
        field(3; "Machine Name"; Text[50])
        {
            Caption = 'Machine Name';
            DataClassification = CustomerContent;
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
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(7; "Frequency Name"; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(8; "Maintenace Type"; Code[20])
        {
            Caption = 'Maintenace Type';
            DataClassification = CustomerContent;
        }
        field(9; "Maintenace Type Name"; Text[50])
        {
            Caption = 'Maintenace Type Name';
            DataClassification = CustomerContent;
        }
        field(11; "Sl. No."; Integer)
        {
            Caption = 'Sl. No.';
            DataClassification = CustomerContent;
        }
        field(12; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(13; "Maint. Sch. Template ID"; Code[20])
        {
            Caption = 'Maint. Sch. Template ID';
            DataClassification = CustomerContent;
        }
        field(14; "Maint. Sch. Template Name"; Text[50])
        {
            Caption = 'Maint. Sch. Template Name';
            DataClassification = CustomerContent;
        }
        field(15; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(16; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
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
            DataClassification = CustomerContent;
            Caption = 'Original ID';
        }
        field(19; "Notice Days"; Integer)
        {
            Caption = 'Notice Days';
            DataClassification = CustomerContent;
        }
        field(20; "Next Due Date"; Date)
        {
            Caption = 'Next Due Date';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                "Next Due Date" := CALCDATE("Date Interval", "Start Date");
            end;
        }
        field(21; "Hrs Required"; Decimal)
        {
            Caption = '"Estimated Time "';
            Editable = false;
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
        field(47; Observations; Text[250])
        {
            Caption = 'Obeservations';
            DataClassification = CustomerContent;
        }
        field(48; Remarks; Text[250])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }
        field(49; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = '" ,Checked,UnChecked"';
            OptionMembers = " ",Checked,UnChecked;
            DataClassification = CustomerContent;
        }
        field(50; Posted; Boolean)
        {
            Caption = 'Posted';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(51; "Schedule Template ID"; Code[20])
        {
            Caption = 'Schedule Template ID';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(57; "Complaint No."; Code[20])
        {
            Caption = 'Complaint No.';
            DataClassification = CustomerContent;
        }
        field(58; "Actual Start Date"; Date)
        {
            Caption = 'Actual Start Date';
            DataClassification = CustomerContent;
        }
        field(67; "Unit Of Measure"; Text[10])
        {
            Caption = 'Unit Of Measure';
            DataClassification = CustomerContent;
        }
        field(68; "Unit Rate"; Decimal)
        {
            Caption = 'Unit Rate';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                TestStatusOpen();
            end;
        }
        field(69; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin

                Amount := Quantity * "Unit Rate";
                TestStatusOpen();
            end;
        }
        field(70; Amount; Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Work Sheet B2B".Amount WHERE("Job Card No." = FIELD("Job Header No."),
                                                         Posted = FILTER(true)));
            Caption = 'Actual Total Cost';
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate();
            begin
                TestStatusOpen();
            end;
        }
        field(71; Resource; Boolean)
        {
            Caption = 'Resource';
            DataClassification = CustomerContent;
        }
        field(72; Spares; Boolean)
        {
            Caption = 'Spares';
            DataClassification = CustomerContent;
        }
        field(73; "Planned Total Cost"; Decimal)
        {
            BlankZero = true;
            DataClassification = CustomerContent;
            Caption = 'Planned Total Cost';
            Editable = false;
        }
        field(74; "Check List Id"; Code[20])
        {
            Caption = 'Check List Id';
            DataClassification = CustomerContent;
        }
        field(75; "Check List Description"; Text[30])
        {
            Caption = 'Check List Description';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Job Header No.", "Machine ID", "Line No.")
        {
        }
        key(Key2; "Sl. No.")
        {
        }
        key(Key3; "Line No.")
        {
        }
        key(Key4; "Machine ID")
        {
        }
        key(Key5; "Machine ID", "Start Date", "Frequency ID", Posted)
        {
            Enabled = false;
        }
        key(Key6; "Machine ID", Posted)
        {
        }
        key(Key7; "Machine ID", "Next Due Date", "Frequency ID", Posted)
        {
        }
    }

    fieldgroups
    {
    }

    var
        PLMCommentLine: Record "PLM Comment Line B2B";
        PMJobHeader: Record "PM Job Header B2B";
        PLMCommentSheet: Page "PLM Comment Sheet B2B";

    procedure ShowLineComments();
    begin
        PLMCommentLine.SETRANGE("No.", "Job Header No.");
        PLMCommentLine.SETRANGE("Document Line No.", "Line No.");
        PLMCommentSheet.SETTABLEVIEW(PLMCommentLine);
        PLMCommentSheet.RUNMODAL();
    end;

    procedure TestStatusOpen();
    begin
        if PMJobHeader.GET("Job Header No.", "Machine ID") then
            PMJobHeader.TESTFIELD(Status, PMJobHeader.Status::Open);
    end;

    procedure PlannedWorksheet();
    var
        PMJobOpeParticulars: Record "PM Job OP Particulars B2B";
        BreakDownPlan: Page "Breakdown Planned WS B2B";
    begin
        CLEAR(BreakDownPlan);
        PMJobOpeParticulars.SETRANGE("Job Card No.", "Job Header No.");
        PMJobOpeParticulars.SETRANGE("PM Line No.", "Line No.");
        BreakDownPlan.SetJobNo("Job Header No.", "Machine ID", "Line No.");
        BreakDownPlan.SETTABLEVIEW(PMJobOpeParticulars);
        BreakDownPlan.RUNMODAL();
    end;
}

