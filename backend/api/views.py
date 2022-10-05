from django.views.decorators.csrf import csrf_exempt
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .serializers import BooksSerializer
from home.models import Books
from django.http import HttpResponse
from rest_framework.authtoken.models import Token
from django.contrib.auth.models import User
from rest_framework.decorators import authentication_classes
from rest_framework.authentication import TokenAuthentication
from rest_framework.decorators import api_view
from rest_framework.decorators import permission_classes
from rest_framework.permissions import IsAuthenticated

@api_view(['GET'])
@authentication_classes((TokenAuthentication,))
@permission_classes((IsAuthenticated,))
def home(request):
    books = Books.objects.all()
    serializer = BooksSerializer(books, many=True)
    #admin = User.objects.get(username="devfemibadmus")
    #token = Token.objects.create(user=admin)
    return Response(serializer.data)


@csrf_exempt
@api_view(['POST'])
@authentication_classes((TokenAuthentication,))
@permission_classes((IsAuthenticated,))
def  createBook(request):
    book = BooksSerializer(data=request.data)
    if book.is_valid():
        book.save()
        return Response(book.data)
    else:
        return HttpResponse(statis=400)


@api_view(['GET'])
@authentication_classes((TokenAuthentication,))
@permission_classes((IsAuthenticated,))
def readBook(request, pk):
    try:
        book = Books.objects.get(pk=pk)
        book = BooksSerializer(book)
        return Response(book.data)
    except Books.DoesNotExist:
        return HttpResponse(status=404)


@csrf_exempt
@api_view(['POST', 'GET'])
@authentication_classes((TokenAuthentication,))
@permission_classes((IsAuthenticated,))
def  updateBook(request, pk):
    try:
        book = Books.objects.get(pk=pk)
        book = BooksSerializer(book, data=request.data)
        if book.is_valid():
            book.save()
            return Response(book.data)
        else:
            return HttpResponse(status=400)
    except Books.DoesNotExist:
        return HttpResponse(status=404)


@api_view(['GET'])
@authentication_classes((TokenAuthentication,))
@permission_classes((IsAuthenticated,))
def  deleteBook(request, pk):
    try:
        book = Books.objects.get(pk=pk)
        book.delete()
        return HttpResponse(status=204)
    except Books.DoesNotExist:
        return HttpResponse(status=404)
