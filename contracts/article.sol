pragma solidity ^0.4.6;

contract ARTICAL

{
 
    struct Article{
        string title;
        string writer;
        string status1;
        string source1;
        string comment;
        string article;
		uint8 rwTvote;
		uint8 rwFvote;
        uint createDate;
        uint updateDate;
    }
    
    mapping(uint => Article) Total;
    uint8 Count=0;

    function addNewArticle(uint8 rwTvote,uint8 rwFvote, string title, string writer,string status1, string source1, string comment, string article) 
    {
       
        Article memory newArticle;
		newArticle.rwTvote=rwTvote;
		newArticle.rwFvote=rwFvote;
        newArticle.title= title;
        newArticle.writer= writer;
        newArticle.status1= status1;
        newArticle.source1= source1;
        newArticle.comment= comment;
        newArticle.article= article;
        newArticle.createDate = now;
        newArticle.updateDate = now;
        Total[Count] = newArticle;
        Count++;
        
    }
    
    function updateStatus(uint8 CountNo, string status1)  
    {
        Total[CountNo].status1= status1;
        Total[CountNo].updateDate = now;
    }
    
    function updateTVotes(uint8 CountNo, uint8 rwTvote)
    {
        Total[CountNo].rwTvote= rwTvote;
    }
    
     function updateFVotes(uint8 CountNo, uint8 rwFvote)
    {
        Total[CountNo].rwFvote= rwFvote;
    }
    
    function GetCount() returns(uint8){
        return Count;
    }
    
    function getVotes(uint8 CountNo) returns(int, int)
    {
        return(  Total[CountNo].rwTvote, Total[CountNo].rwFvote);
    }
    
    function getArticle(uint8 CountNo) returns (string, string ,string , string , string , string )
    {
        return (Total[CountNo].title, Total[CountNo].writer,Total[CountNo].status1,Total[CountNo].source1,Total[CountNo].comment,Total[CountNo].article );
    }
}