table 33000890 "Plant Maintenance Setup B2B"
{

    Caption = 'Plant Maintainance SetUp';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(3; "Machine Nos."; Code[10])
        {
            Caption = 'Machine Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(5; "Machine Spec. Nos."; Code[10])
        {
            Caption = 'Machine Spec. Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(8; "PM Sepc. Template Nos."; Code[10])
        {
            Caption = 'PM Sepc. Template Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(9; "Maint. Sch. TemplateNos."; Code[10])
        {
            Caption = 'Maint. Sch. TemplateNos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(10; "Maint. Sch. TempLineNo"; Code[10])
        {
            Caption = 'Maint. Sch. TempLineNo';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(11; "Machine Spare Nos."; Code[10])
        {
            Caption = 'Machine Spare Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(12; "PM Complaint Nos."; Code[10])
        {
            Caption = 'PM Complaint Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(14; "PM Movement Nos."; Code[10])
        {
            Caption = 'PM Movement Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(16; "Time Duration"; Integer)
        {
            Caption = 'Time Duration';
            DataClassification = CustomerContent;
        }
        field(17; "Last PM Run Date"; DateTime)
        {
            Caption = 'Last PM Run Date';
            DataClassification = CustomerContent;
        }
        field(18; "PM Spare Master Nos."; Code[10])
        {
            Caption = 'PM Spare Master Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(20; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            TableRelation = "Item Category".Code;
            DataClassification = CustomerContent;
        }
        field(30; "PMR Job Card"; Code[10])
        {
            Caption = 'PMR Job Card';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(31; Allowance; DateFormula)
        {
            Caption = 'Allowance';
            DataClassification = CustomerContent;
        }
        field(40; "Complaint Nos."; Code[20])
        {
            Caption = 'Complaint Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(41; "PM Calendar Code"; Code[20])
        {
            Caption = 'PM Calendar Code';
            TableRelation = "Base Calendar";
            DataClassification = CustomerContent;
        }
        field(50; "Item Journal Batch"; Code[10])
        {
            Caption = 'Item Journal Batch';
            TableRelation = "Item Journal Batch".Name;
            DataClassification = CustomerContent;
        }
        field(51; "Resource Journal Batch"; Code[10])
        {
            Caption = 'Resource Journal Batch';
            DataClassification = CustomerContent;

            trigger OnLookup();
            begin
                ResJnlBatch.FILTERGROUP(2);
                ResJnlBatch.SETRANGE("Journal Template Name", ResourceLbl);
                ResJnlBatch.FILTERGROUP(0);
                if PAGE.RUNMODAL(0, ResJnlBatch) = ACTION::LookupOK then
                    "Resource Journal Batch" := ResJnlBatch.Name;
            end;

        }
        field(55; "G/L Account No."; Code[10])
        {
            Caption = 'G/L Account No.';
            TableRelation = "G/L Account"."No.";
            DataClassification = CustomerContent;
        }
        field(56; "Check List Nos."; Code[20])
        {
            Caption = 'Check List Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(57; "Break Down Job Card"; Code[10])
        {
            Caption = 'Break Down Job Card';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(58; "Others Job Card"; Code[10])
        {
            Caption = 'Others Job Card';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(59; "Run Time Freqency No."; Code[10])
        {
            Caption = 'Run Time Freqency No.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(60; "Test For Predictive No."; Code[10])
        {
            Caption = 'Test For Predictive No.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(61; "Resource Template"; Code[10])
        {
            Caption = 'Resource Template';
            TableRelation = "Res. Journal Template";
            DataClassification = CustomerContent;
        }
        field(62; "Item Template"; Code[10])
        {
            Caption = 'Item Template';
            TableRelation = "Item Journal Template";
            DataClassification = CustomerContent;
        }
        field(63; "Equipment Template"; Code[10])
        {
            Caption = 'Equipment Template';
            TableRelation = "Res. Journal Template";
            DataClassification = CustomerContent;
        }
        field(64; "Equipment Journal Batch"; Code[20])
        {
            Caption = 'Equipment Journal Batch';
            TableRelation = "Res. Journal Batch".Name WHERE(Name = FIELD("Resource Journal Batch"));
            DataClassification = CustomerContent;
        }
        field(65; "Fixed Asset Template"; Code[10])
        {
            Caption = 'Fixed Asset Template';
            TableRelation = "FA Journal Template";
            DataClassification = CustomerContent;
        }
        field(66; "Fixed Asset Journal Batch"; Code[10])
        {
            Caption = 'Fixed Asset Journal Batch';
            TableRelation = "FA Journal Batch".Name WHERE("Journal Template Name" = FIELD("Fixed Asset Journal Batch"));
            DataClassification = CustomerContent;
        }
        field(67; "General Journal Line Batch"; Code[20])
        {
            Caption = 'General Journal Line Batch';
            TableRelation = "Gen. Journal Batch" WHERE("Journal Template Name" = FIELD("General Journal Line Batch"));
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
        }
    }

    fieldgroups
    {
    }

    var
        ResJnlBatch: Record "Res. Journal Batch";
        ResourceLbl: Label 'RESOURCES';
}

