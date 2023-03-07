codeunit 33000891 "PMJnlManagement B2B"
{

    Permissions = TableData "Res. Journal Template" = imd,
                  TableData "Res. Journal Batch" = imd;

    trigger OnRun();
    begin
    end;

    var
        ResJnlTemplate: Record "Res. Journal Template";
        Text000Lbl: Label 'RESOURCES';
        Text001Lbl: Label 'Resource Journals';
        Text002Lbl: Label 'RECURRING';
        Text003Lbl: Label 'Recurring Resource Journal';
        Text004Lbl: Label 'DEFAULT';
        Text005Lbl: Label 'Default Journal';
        OldResNo: Code[20];

    procedure TemplateSelection(FormID: Integer; RecurringJnl: Boolean; var PMJnlLine: Record "Equipment Journals B2B"; var JnlSelected: Boolean);
    var

    begin
        JnlSelected := true;

        ResJnlTemplate.RESET();
        ResJnlTemplate.SETRANGE("Page ID", FormID);
        ResJnlTemplate.SETRANGE(Recurring, RecurringJnl);
        case ResJnlTemplate.COUNT() of
            0:
                begin
                    ResJnlTemplate.INIT();
                    ResJnlTemplate.Recurring := RecurringJnl;
                    if not RecurringJnl then begin
                        ResJnlTemplate.Name := Text000Lbl;
                        ResJnlTemplate.Description := Text001Lbl;
                    end else begin
                        ResJnlTemplate.Name := Text002Lbl;
                        ResJnlTemplate.Description := Text003Lbl;
                    end;
                    ResJnlTemplate.VALIDATE("Page ID", FormID);
                    ResJnlTemplate.INSERT();
                    COMMIT();
                end;
            1:
                ResJnlTemplate.FIND('-');
            else
                JnlSelected := PAGE.RUNMODAL(0, ResJnlTemplate) = ACTION::LookupOK;
        end;
        if JnlSelected then begin
            PMJnlLine.FILTERGROUP := 2;
            PMJnlLine.SETRANGE("Journal Template Name", ResJnlTemplate.Name);
            PMJnlLine.FILTERGROUP := 0;
        end;
    end;

    procedure OpenJnl(var CurrentJnlBatchName: Code[10]; var PMJnlLine: Record "Equipment Journals B2B");
    begin
        CheckTemplateName(PMJnlLine.GETRANGEMAX("Journal Template Name"), CurrentJnlBatchName);
        PMJnlLine.FILTERGROUP := 2;
        PMJnlLine.SETRANGE("Journal Batch Name", CurrentJnlBatchName);
        PMJnlLine.FILTERGROUP := 0;
    end;

    procedure CheckTemplateName(CurrentJnlTemplateName: Code[10]; var CurrentJnlBatchName: Code[10]);
    var
        ResJnlBatch: Record "Res. Journal Batch";
    begin
        ResJnlBatch.SETRANGE("Journal Template Name", CurrentJnlTemplateName);
        if not ResJnlBatch.GET(CurrentJnlTemplateName, CurrentJnlBatchName) then begin
            if not ResJnlBatch.FIND('-') then begin
                ResJnlBatch.INIT();
                ResJnlBatch."Journal Template Name" := CurrentJnlTemplateName;
                ResJnlBatch.SetupNewBatch();
                ResJnlBatch.Name := Text004Lbl;
                ResJnlBatch.Description := Text005Lbl;
                ResJnlBatch.INSERT(true);
                COMMIT();
            end;
            CurrentJnlBatchName := ResJnlBatch.Name;
        end;
    end;

    procedure CheckName(CurrentJnlBatchName: Code[10]; var ResJnlLine: Record "Res. Journal Line");
    var
        ResJnlBatch: Record "Res. Journal Batch";
    begin
        ResJnlBatch.GET(ResJnlLine.GETRANGEMAX("Journal Template Name"), CurrentJnlBatchName);
    end;

    procedure SetName(CurrentJnlBatchName: Code[10]; var ResJnlLine: Record "Res. Journal Line");
    begin
        ResJnlLine.FILTERGROUP := 2;
        ResJnlLine.SETRANGE("Journal Batch Name", CurrentJnlBatchName);
        ResJnlLine.FILTERGROUP := 0;
        if ResJnlLine.FIND('-') then;
    end;

    procedure LookupName(var CurrentJnlBatchName: Code[10]; var ResJnlLine: Record "Res. Journal Line"): Boolean;
    var
        ResJnlBatch: Record "Res. Journal Batch";
    begin
        COMMIT();
        ResJnlBatch."Journal Template Name" := ResJnlLine.GETRANGEMAX("Journal Template Name");
        ResJnlBatch.Name := ResJnlLine.GETRANGEMAX("Journal Batch Name");
        ResJnlBatch.FILTERGROUP := 2;
        ResJnlBatch.SETRANGE("Journal Template Name", ResJnlBatch."Journal Template Name");
        ResJnlBatch.FILTERGROUP := 0;
        if PAGE.RUNMODAL(0, ResJnlBatch) = ACTION::LookupOK then begin
            CurrentJnlBatchName := ResJnlBatch.Name;
            SetName(CurrentJnlBatchName, ResJnlLine);
        end;
    end;

    procedure GetRes(ResNo: Code[20]; var ResName: Text[100]);
    var
        Res: Record Resource;
    begin
        if ResNo <> OldResNo then begin
            ResName := '';
            if ResNo <> '' then
                if Res.GET(ResNo) then
                    ResName := Res.Name;
            OldResNo := ResNo;
        end;
    end;
}

