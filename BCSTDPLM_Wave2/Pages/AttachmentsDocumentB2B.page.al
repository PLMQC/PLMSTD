page 33000910 "Attachments Document B2B"
{

    Caption = 'Attachments Document';
    DeleteAllowed = true;
    PageType = List;
    SourceTable = "Attachment Documents B2B";
    ApplicationArea = All;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Defines File Name.';
                    Editable = false;

                    trigger OnDrillDown();
                    begin
                        GeneralLedgerSetup.GET();
                        GeneralLedgerSetup.TESTFIELD("Attachment St. Location B2B");

                        FinalFolderPathGVar := GeneralLedgerSetup."Attachment St. Location B2B";

                        if Rec."File Name" = ClickHereTextLbl then begin
                            CLEAR(TempAttachment);
                            if TempAttachment.ImportAttachment('', true) then begin
                                AttachmentDocuments2.RESET();
                                AttachmentDocuments2.SETRANGE("Table Id", TableIDGVar);
                                AttachmentDocuments2.SETRANGE("Document No.", DocumentNoGVar);
                                if AttachmentDocuments2.FINDLAST() then
                                    Rec."No." := AttachmentDocuments2."No." + 1
                                else
                                    Rec."No." := 1;
                                Rec.Attachment := TempAttachment.Attachment;
                                Rec."File Name" := TempAttachment."File Name";
                                Rec."File Extension" := TempAttachment."File Extension";
                                Rec."Filter Key 1" := FilterKey1GVar;
                                Rec."Filter Key 2" := FilterKey2GVar;
                                Rec."Document No." := DocumentNoGVar;
                                Rec."Table Id" := TableIDGVar;
                                //if EXISTS(FinalFolderPathGVar + "File Name") then
                                //  ERROR(FileExistTextLbl);
                                if Rec.Attachment.HASVALUE() then begin
                                    FileNameGVar := FinalFolderPathGVar + Rec."File Name";
                                    //Attachment.EXPORT(FileNameGVar);
                                    Rec."File Path" := FileNameGVar;
                                    //CLEAR(Attachment);
                                end;
                            end;
                        end else
                            OpenDocument();
                    end;
                }
                field("File Extension"; Rec."File Extension")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Defines File Extension.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Open Document")
            {
                Caption = 'Open Document';
                Image = Document;
                ApplicationArea = All;
                ToolTip = 'Defines Open Document.';

                trigger OnAction();
                begin
                    OpenDocument();
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        Rec."File Name" := ClickHereTextLbl
    end;

    var
        TempAttachment: Record "Attachment Documents B2B" temporary;
        GeneralLedgerSetup: Record "General Ledger Setup";
        AttachmentDocuments2: Record "Attachment Documents B2B";
        FileNameGVar: Text[250];
        /*TempFile: File;
        FileInstream: InStream;
        AttachmentOutstream: OutStream;
        SystemIODirectory: DotNet "'mscorlib'.System.IO.Directory";
        SystemIODirectoryInfo: DotNet "'mscorlib'.System.IO.DirectoryInfo";*/
        FinalFolderPathGVar: Text;
        FilterKey1GVar: Code[20];
        FilterKey2GVar: Code[20];
        DocumentNoGVar: Code[20];
        TableIDGVar: Integer;
        ClickHereTextLbl: Label '<Click here to upload>';
        //FileExistTextLbl: Label 'File Already exist %1';
        SymbolTextLbl: Label '"/!@#$%^&*()?\"";:,<>-"';
        EqualTextLbl: Label '=';

    procedure OpenDocument();
    var
    /*TempBLOB: Record TempBlob temporary;
    Attachment2: Record "Attachment Documents";
    FileManagement: Codeunit "File Management";
    FileMgt: Codeunit "File Management";
    FileName: Text;*/
    begin
        /*Attachment2.RESET();
        Attachment2.SETRANGE("Table Id", "Table Id");
        Attachment2.SETRANGE("Document No.", "Document No.");
        Attachment2.SETRANGE("No.", "No.");
        if FilterKey1GVar <> '' then
            Attachment2.SETRANGE("Filter Key 1", FilterKey1GVar);
        if FilterKey2GVar <> '' then
            Attachment2.SETRANGE("Filter Key 2", FilterKey2GVar);
        if Attachment2.FINDSET() then begin

            FileNameGVar := Attachment2."File Path";
            TempFile.OPEN(FileNameGVar);
            TempFile.CREATEINSTREAM(FileInstream);

            Attachment2.Attachment.CREATEOUTSTREAM(AttachmentOutstream);
            COPYSTREAM(AttachmentOutstream, FileInstream);
            Attachment2.MODIFY();
            TempFile.CLOSE;
        end;

        Attachment2.RESET();
        Attachment2.SETRANGE("Table Id", "Table Id");
        Attachment2.SETRANGE("Document No.", "Document No.");
        Attachment2.SETRANGE("No.", "No.");
        if FilterKey1GVar <> '' then
            Attachment2.SETRANGE("Filter Key 1", FilterKey1GVar);
        if FilterKey2GVar <> '' then
            Attachment2.SETRANGE("Filter Key 2", FilterKey2GVar);
        if Attachment2.FINDSET() then begin
            Attachment2.CALCFIELDS(Attachment2.Attachment);
            if Attachment2.Attachment.HASVALUE() then
                TempBLOB.Blob := Attachment2.Attachment;
            FileName := "File Name";
            FileName := FileMgt.GetFileNameWithoutExtension(FileName);
            FileName := FileName + '.' + Attachment2."File Extension";
            FileName := FileManagement.BLOBExport(TempBLOB, FileName, true);

            CLEAR(Attachment2.Attachment);
            Attachment2.MODIFY();
        end;*/
    end;

    /*local procedure CreateDirectory(path: Text; showconfirmation: Boolean): Text[250];
    begin
        /*if SystemIODirectory.Exists(path) then
            exit(path);

        SystemIODirectoryInfo := SystemIODirectory.CreateDirectory(path);
        exit(path);
    end;*/

    /*local procedure DeleteDirectory(path: Text; recursive: Boolean; showconfirmation: Boolean);
    begin
    end;*/

    local procedure RemoveSpecialChar(PageNameLPar: Text[250]): Text[250];
    begin
        exit(DELCHR(PageNameLPar, EqualTextLbl, SymbolTextLbl));
    end;

    procedure SetValues(FilterKey1LPar: Code[20]; FilterKey2LPar: Code[20]; DocumentNoLPar: Code[20]; TableIDLPar: Integer);
    begin
        FilterKey1GVar := FilterKey1LPar;
        FilterKey2GVar := FilterKey2LPar;
        DocumentNoGVar := DocumentNoLPar;
        TableIDGVar := TableIDLPar;
    end;
}
