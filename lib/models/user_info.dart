class UserInfo {
  int _namsinh;
  double _chieucao;
  double _cannang;
  String _gioitinh;
  double _bmiIndex;

  UserInfo(this._namsinh, this._chieucao, this._cannang, this._gioitinh,
      this._bmiIndex);
  UserInfo.withoutBMI(
      this._namsinh, this._chieucao, this._cannang, this._gioitinh);
}
