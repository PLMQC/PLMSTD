table 33000907 "Equipment Journals B2B"
{

    Caption = 'Equipment Journals';

    fields
    {
        field(1; "Journal Template Name"; Code[20])
        {
            Caption = 'Journal Template Name';
            DataClassification = CustomerContent;
            TableRelation = "Res. Journal Template";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Journal Batch Name"; Code[20])
        {
            Caption = 'Journal Batch Name';
            DataClassification = CustomerContent;
            TableRelation = "Res. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Journal Template Name"));
        }
        field(9; "Work Center No."; Code[20])
        {
            Caption = 'Work Center No.';
            DataClassification = CustomerContent;
        }
        field(10; "Machine No."; Code[20])
        {
            Caption = 'Machine No.';
            DataClassification = CustomerContent;

            trigger OnLookup();
            begin
                Equipment.RESET();
                Equipment.SETRANGE("Machine Type", Equipment."Machine Type"::"Non-Production");
                if PAGE.RUNMODAL(0, Equipment) = ACTION::LookupOK then begin
                    EquipmentJournalsGRec.SETRANGE("Machine No.", Equipment."No.");
                    if EquipmentJournalsGRec.FINDFIRST() then
                        ERROR(Text005Lbl);
                    VALIDATE("Machine No.", Equipment."No.");
                    VALIDATE("Shortcut Dimension 1 Code", Equipment."Shortcut Dimension 1 Code");
                    VALIDATE("Shortcut Dimension 2 Code", Equipment."Shortcut Dimension 2 Code");
                    VALIDATE(UOM, Equipment."Capacity Unit of Measure");
                end;
            end;

            trigger OnValidate();
            begin
                Machine.RESET();
                if Machine.GET("Machine No.") then begin
                    "Machine Description" := Machine.Name;
                    UOM := Machine."Capacity Unit of Measure";
                end else begin
                    "Machine Description" := '';
                    UOM := '';
                end;
            end;
        }
        field(11; "Start Date Time"; DateTime)
        {
            Caption = 'Start Date Time';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if "End Date Time" <> 0DT then begin
                    if "End Date Time" < "Start Date Time" then
                        ERROR(Text004Lbl);

                    "Time Duration" := "End Date Time" - "Start Date Time";
                    "Total Minutes" := ("End Date Time" - "Start Date Time") / 60000;
                    "Time(Hrs)" := ("Total Minutes") / 60;
                end;
            end;
        }
        field(12; "End Date Time"; DateTime)
        {
            Caption = 'End Date Time';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                VALIDATE("Start Date Time");
            end;
        }
        field(13; Type; Option)
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
            OptionCaption = '" ,Run Time,Stop Time,Meters"';
            OptionMembers = " ","Run Time","Stop Time",Meters;
        }
        field(14; "Total Minutes"; Decimal)
        {
            Caption = 'Total Minutes';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                "Time(Hrs)" := ("Total Minutes") / 60;
            end;
        }
        field(15; UOM; Code[10])
        {
            Caption = 'UOM';
            Editable = false;
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
        }
        field(16; "P/B Type"; Option)
        {
            Caption = 'P/B Type';
            DataClassification = CustomerContent;
            OptionCaption = '"PMR,BreakDown, "';
            OptionMembers = PMR,BreakDown," ";
        }
        field(19; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(20; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(21; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                VALIDATE("Document Date", "Posting Date");
            end;
        }
        field(22; Remarks; Text[100])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }
        field(23; "Machine Description"; Text[50])
        {
            Caption = 'Machine Description';
            DataClassification = CustomerContent;
        }
        field(24; "Time Duration"; Duration)
        {
            Caption = 'Time Duration';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(25; "Time(Hrs)"; Decimal)
        {
            Caption = 'Time(Hrs)';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 2;
        }
        field(26; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(27; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(35; Meters; Decimal)
        {
            Caption = 'Meters';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", "Journal Batch Name", "Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        LOCKTABLE();
        ResJnlTemplate.GET("Journal Template Name");
        ResJnlBatch.GET("Journal Template Name", "Journal Batch Name");
    end;

    var
        ResJnlTemplate: Record "Res. Journal Template";
        PostedPMJ: Record "Equipment Log B2B";
        ResJnlBatch: Record "Res. Journal Batch";
        Machine: Record "Equipment B2B";
        Frequency: Record "Frequency  B2B";
        MaintSchedulePart: Record "Maintenance Schedule Part B2B";
        PMJnlLine: Record "Equipment Journals B2B";
        Equipment: Record "Equipment B2B";
        EquipmentJournalsGRec: Record "Equipment Journals B2B";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Text004Lbl: Label 'End Time should be greater than Start Time.';

        Text005Lbl: Label 'Machine already exists.';

    procedure SetUpNewLine(LastEqpJnlLine: Record "Equipment Journals B2B");
    begin
        ResJnlTemplate.GET("Journal Template Name");
        ResJnlBatch.GET("Journal Template Name", "Journal Batch Name");

        PMJnlLine.SETRANGE("Journal Template Name", "Journal Template Name");
        PMJnlLine.SETRANGE("Journal Batch Name", "Journal Batch Name");
        if PMJnlLine.FIND('-') then begin
            "Posting Date" := LastEqpJnlLine."Posting Date";
            "Document Date" := LastEqpJnlLine."Posting Date";
            "Document No." := LastEqpJnlLine."Document No.";
        end else begin
            "Posting Date" := TODAY();
            "Document Date" := TODAY();
            if ResJnlBatch."No. Series" <> '' then begin
                ;
                CLEAR(NoSeriesMgt);
            end;
        end;
    end;

    procedure PostJournals(PMJournal: Record "Equipment Journals B2B"; var IsPosted: Boolean);
    var
        NextEntryNo: Integer;
    begin
        if PMJournal.FIND('-') then;
        repeat
            PostedPMJ.INIT();
            PostedPMJ.LOCKTABLE();

            if PostedPMJ.FIND('+') then begin
                NextEntryNo := PostedPMJ."Entry No.";
                NextEntryNo := NextEntryNo + 1
            end else
                NextEntryNo := 1;

            PostedPMJ."Entry No." := NextEntryNo;
            PostedPMJ."User ID" := Format(USERID());
            PostedPMJ."Journal Template Name" := PMJournal."Journal Template Name";
            PostedPMJ."Journal Batch Name" := PMJournal."Journal Batch Name";
            PostedPMJ."Machine No." := PMJournal."Machine No.";
            PostedPMJ."Work Center No." := PMJournal."Work Center No.";
            PostedPMJ."Machine Description" := PMJournal."Machine Description";
            PostedPMJ."Start Time" := PMJournal."Start Date Time";
            PostedPMJ."End Time" := PMJournal."End Date Time";
            PostedPMJ."Time Duration" := PMJournal."Time Duration";
            PostedPMJ."Total Minutes" := PMJournal."Total Minutes";
            PostedPMJ.UOM := PMJournal.UOM;
            PostedPMJ."Time(Hrs)" := PMJournal."Time(Hrs)";
            PostedPMJ.Meters := PMJournal.Meters;
            PostedPMJ.Type := PMJournal.Type;
            PostedPMJ."P/B Type" := PMJournal."P/B Type";
            PostedPMJ."Document No." := PMJournal."Document No.";
            PostedPMJ."Document Date" := PMJournal."Document Date";
            PostedPMJ."Posting Date" := PMJournal."Posting Date";
            PostedPMJ.Remarks := PMJournal.Remarks;
            IsPosted := true;
            PostedPMJ.INSERT();
        until PMJournal.NEXT() = 0;

        MaintSchedulePart.SETRANGE("Machine ID", PMJournal."Machine No.");
        MaintSchedulePart.SETFILTER(MaintSchedulePart."Line Late Reading", '=%1', 0);
        if MaintSchedulePart.FINDFIRST() then begin
            Frequency.GET(MaintSchedulePart."Frequency ID");
            if Frequency."Run Time" then begin
                ;
                if Machine.GET(PostedPMJ."Machine No.") then begin
                    ;
                    if Machine."Machine Type" = Machine."Machine Type"::Production then begin
                        Machine.CALCFIELDS(Machine."Total Run Time - Prod");
                        Machine."Last Reading" := Machine."Total Run Time - Prod";
                        Machine.MODIFY();
                    end else begin
                        Machine.CALCFIELDS(Machine."Total Run Time Non Prod.");
                        Machine."Last Reading" := Machine."Total Run Time Non Prod.";
                        Machine.MODIFY();
                    end;
                end;
            end;
        end;

        PMJournal.RESET();
        PMJournal.SETRANGE("Journal Template Name", PMJournal."Journal Template Name");
        PMJournal.SETRANGE("Journal Batch Name", PMJournal."Journal Batch Name");
        if PMJournal.FIND('-') then
            PMJournal.DELETEALL();
        PMJournal.MODIFYALL("Posting Date", 0D, false);
        PMJournal.MODIFYALL("Document No.", '', false);
        PMJournal.MODIFYALL("Start Date Time", 0DT, false);
        PMJournal.MODIFYALL("End Date Time", 0DT, false);
        PMJournal.MODIFYALL("Time(Hrs)", 0, false);
    end;
}

